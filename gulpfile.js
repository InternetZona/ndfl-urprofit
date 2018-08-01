const path = require('path');
const del = require('del');
const runSequence = require('run-sequence');
const ftp = require('vinyl-ftp');

const gulp = require('gulp');
const gulpLoadPlugins = require('gulp-load-plugins');
const $ = gulpLoadPlugins();

const config = require('./config');
const mode = {
  production: process.env.NODE_ENV === 'production',
}


gulp.task('js', function() {
  gulp
    .src(path.join(config.dev + 'assets/js/app.js'))
    .pipe($.plumber())
    .pipe($.rigger())
    .pipe($.if(!mode.production, $.sourcemaps.init()))
    .pipe($.if(mode.production, $.uglify()))
    .pipe($.rename({
      suffix: '.min'
    }))
    .pipe($.size())
    .pipe($.if(!mode.production, $.sourcemaps.write()))
    .pipe(gulp.dest(path.join(config.assets, config.project, 'templates/default/js/')));
});

gulp.task('css', function() {
  gulp
    .src(path.join(config.dev + 'assets/sass/style.scss'))
    .pipe($.plumber())
    .pipe($.if(!mode.production, $.sourcemaps.init()))
    .pipe($.sass())
    .pipe($.autoprefixer(['last 3 versions'], { cascade: true }))
    .pipe($.cssnano())
    .pipe($.if(!mode.production, $.sourcemaps.write()))
    .pipe($.rename({
      suffix: '.min'
    }))
    .pipe($.size())
    .pipe(gulp.dest(path.join(config.assets, config.project, 'templates/default/css/')));
});

gulp.task('html', ['php'], function() {
  gulp
    .src(path.join(config.dev, 'core/**/*.tpl'))
    .pipe($.plumber())
    .pipe($.if(!mode.production, $.newer(path.join(config.core, config.project))))
    .pipe($.if(mode.production, $.htmlmin({
      removeComments: true,
      collapseWhitespace: true,
      collapseBooleanAttributes: true,
      removeAttributeQuotes: false,
      removeRedundantAttributes: false,
      removeEmptyAttributes: true,
      removeScriptTypeAttributes: true,
      removeStyleLinkTypeAttributes: true,
      removeOptionalTags: false
    })))
    .pipe($.size())
    .pipe(gulp.dest(path.join(config.core, config.project)));
});

gulp.task('php_assets', function() {
  gulp
    .src(path.join(config.dev, 'assets/**/*.php'))
    .pipe($.plumber())
    .pipe($.if(!mode.production, $.newer(config.assets, config.project)))
    .pipe(gulp.dest(path.join(config.assets, config.project)));
});

gulp.task('php_core', function() {
  gulp
    .src(path.join(config.dev, 'core/**/*.php'))
    .pipe($.plumber())
    .pipe($.if(!mode.production, $.newer(config.core, config.project)))
    .pipe(gulp.dest(path.join(config.core, config.project)));
});

gulp.task('php', ['php_assets', 'php_core']);

gulp.task('watch', function() {
  gulp.watch(path.join(config.dev + 'assets/sass/**/*.scss'), ['css']);
  gulp.watch(path.join(config.dev + 'assets/js/**/*.js'), ['js']);
  gulp.watch(path.join(config.dev + 'assets/**/*.php'), ['php_assets']);
  gulp.watch(path.join(config.dev + 'core/**/*.php'), ['php_core']);
  gulp.watch(path.join(config.dev + 'core/**/*.tpl'), ['html']);
});

gulp.task('clean', function() {
  del([path.join(config.assets, config.project, 'templates/default/css')]);
  del([path.join(config.assets, config.project, 'templates/default/js')]);
});

gulp.task('build', ['clean'], cb => runSequence(
  'css',
  'js',
  'html',
  cb
));

gulp.task('default', ['build'], cb => runSequence(
  'watch',
  cb
));

const connCfg = {
  host: config.deploy.host,
  user: config.deploy.username,
  password: config.deploy.password,
  parallel: 10,
};

const conn = ftp.create(connCfg);

gulp.task('deploy', function() {
  let folderToPush = [path.join('assets'), path.join('core')];

  if (!mode.production) {
    return false;
  }

  return gulp
    .src(folderToPush, { buffer: false })
    .pipe($.plumber())
    /*.pipe($.prompt.confirm({
      message: 'Heads Up! Check ../config.json & Confirm deploy',
      default: false,
    }))*/
    .pipe(conn.newer('./'))
    .pipe(conn.dest('./'));
});


