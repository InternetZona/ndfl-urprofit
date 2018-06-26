{if $sliderIds = {tv name=slider}}
    {$params=[
    'where'     => [
        'id:in' => explode('||', $sliderIds)
    ]
    ,'limit'    => 0
    ,'sort'     => 'menuindex'
    ,'dir'      => 'asc'
    ]}

    {processor action="site/web/resources/getdata" ns="modxsite" params=$params assign=result}

    {if $result.success && $result.count > 0}

        <div class="row row--grid">

            {foreach $result.object as $object}

                {$childIds = $modx->getChildIds($object.id)}

                <div class="col s24 m12 l12 xl8">

                    <div class="card card--service">
                        <div class="card-image">

                            {snippet name="pThumb" params=[
                            "input" => $object.tvs.image.value
                            ,"options" => "&w=480&h=320&zc=1&aoe=0&far=0&q=85"
                            ] assign=imageThumb}

                            <img src="{$imageThumb}" class="responsive-img">

                            {if $object.introtext}
                                <div class="content-overlay">
                                    {$object.introtext}
                                </div>
                            {/if}

                            <div class="card-title">
                                <a href="{$object.uri}">{$object.menutitle|default:$object.pagetitle}</a>

                                {if count($childIds) > 0 }
                                    <span class="activator right"><i class="material-icons">menu</i></span>
                                {/if}

                            </div>
                        </div>
                        <div class="card-action">
                            <div class="row row--grid">
                                <div class="col s12">

                                    {if $price = $object.tvs.price.value|default:0}

                                        <span class="service-price">
                                        {if $object.tvs.isfrom.value}
                                            от
                                        {/if}

                                            {$price|number_format:0:",":" "|cat:" руб"}
                                    </span>
                                    {/if}
                                </div>
                                <div class="col s12">
                                    <a href="#order" class="btn link--scroller">Заказать</a>
                                </div>
                            </div>
                        </div>
                        {if count($childIds) > 0}
                            <div class="card-reveal">
                                <span class="card-title grey-text text-darken-4">{$object.menutitle|default:$object.pagetitle}<i class="material-icons right">close</i></span>
                                <ul class="menu-service">

                                    {snippet name="Wayfinder@Wayfinder" params=[
                                    'startId'   => $object.id
                                    ]}

                                </ul>
                            </div>
                        {/if}
                    </div>

                    {*<div class="card card--service">
                        <div class="card-header">
                            <a href="{$object.uri}">{$object.menutitle|default:$object.pagetitle}</a>
                        </div>
                        <div class="card-image">
                            {snippet name="pThumb" params=[
                            "input" => $object.tvs.image.value
                            ,"options" => "&w=480&h=320&zc=1&aoe=0&far=0&q=85"
                            ] assign=imageThumb}

                            <img src="{$imageThumb}" class="responsive-img">

                            <div class="card-title">
                                <ul>

                                    {snippet name="Wayfinder@Wayfinder" params=[
                                    'startId'   => $object.id
                                    ]}

                                </ul>
                            </div>
                        </div>
                        *}{*<div class="card-image">
                        {snippet name="pThumb" params=[
                            "input" => $object.tvs.image.value
                            ,"options" => "&w=480&h=320&zc=1&aoe=0&far=0&q=85"
                        ] assign=imageThumb}

                        <img src="{$imageThumb}" class="responsive-img">

                        <div class="card-title">
                            <ul>

                                {snippet name="Wayfinder@Wayfinder" params=[
                                'startId'   => $object.id
                                ]}

                            </ul>
                        </div>
                    </div>*}{*
                    <div class="card-footer">
                        <div class="row">
                            <div class="col s12">

                                {if $price = $object.tvs.price.value|default:0}

                                    {if $object.tvs.isfrom}
                                        от
                                    {/if}

                                    {$price|number_format:0:",":" "|cat:" руб"}
                                {/if}
                            </div>
                            <div class="col s12">
                                <a href="#order" class="btn link--scroller">Заказать</a>
                            </div>
                        </div>
                    </div>
                </div>*}

                </div>

            {/foreach}

        </div>

    {/if}
{/if}