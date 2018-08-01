{$tvFeatured = {tv name=featured}|json_decode:true}

{if $tvFeatured}
    <div class="section featured">
        <div class="section__title h2 center-align">Преимущества работы с нами</div>

        <div class="row row--grid">

            {foreach $tvFeatured as $data}

                <div class="col s12 l6">

                    <div class="card card--featured">
                        <div class="card-image">
                            {snippet name="pThumb" params=[
                            "input" => $data.image
                            ,"options" => "&w=100&h=100&zc=1&aoe=0&far=0&q=85"
                            ] assign=imageThumb}

                            <img src="{$imageThumb}" class="center-block">
                        </div>
                        <div class="card-content">
                            {$data.title}
                        </div>
                    </div>

                </div>

            {/foreach}
        </div>
    </div>
{/if}