<nav>
    <div class="container">
        <div class="nav-wrapper">

            {if {config name=site_start} == {field name=id}}

                <span class="brand-logo">
                    <img src="{$template_url}img/logo_urprofit.png" class="responsive-img">
                    Юрпрофит <small>Подготовка деклараций 3-НДФЛ</small>
                </span>

                {else}

                <a href="{$modx->makeUrl({config name=site_start})}" class="brand-logo">
                    <img src="{$template_url}img/logo_urprofit.png" class="responsive-img">
                    Юрпрофит <small>Подготовка деклараций 3-НДФЛ</small>
                </a>

            {/if}

            <a href="#" data-target="mobile-demo" class="sidenav-trigger"><i class="material-icons">menu</i></a>
            <ul id="navbar-desktop" class="right hide-on-med-and-down">

                <li>
                    <a class="dropdown-trigger no-autoinit" href="#" data-target="dd-service" data-config="panel">Услуги</a>
                    <div id="dd-service" class="dropdown-content">

                        <div class="row">

                            {$parts = [3,2,8,9]}

                            {foreach $parts as $part}

                                <div class="col l5">
                                    <ul class="navbar-menu">
                                        {snippet name="Wayfinder@Wayfinder" params=[
                                            'startId'   => $part
                                            ,'level'    => 1
                                            ,'displayStart' => true
                                            ,'startItemTpl' => 'wf.start_item.tpl'
                                        ]}
                                    </ul>
                                </div>

                            {/foreach}

                            <div class="col l4">
                                <ul class="navbar-menu navbar-menu--bolder">
                                    {snippet name="Wayfinder@Wayfinder" params=[
                                        'startId'   => 0
                                        ,'level'    => 1
                                        ,'where'    => '{"template":"6"}'
                                        ,'excludeDocs' => "3,2,8,9"
                                    ]}
                                </ul>
                            </div>

                        </div>

                    </div>
                </li>

                {snippet name="Wayfinder@Wayfinder" params=[
                    'startId'   => 0
                    ,'excludeDocs'  => {config name=site_start}
                    ,'level'    => 1
                    ,'where'    => json_encode([
                    'template:!='   => 6
                    ])
                ]}
            </ul>
        </div>
    </div>
</nav>