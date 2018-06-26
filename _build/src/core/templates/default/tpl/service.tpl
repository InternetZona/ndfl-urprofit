{extends file="basepage.tpl"}

{block name=body}

    <div class="container">

        <div class="row">

            <div class="col l7 hide-on-med-and-down">
                <ul class="menu-aside collapsible">
                    {snippet name="Wayfinder@Aside" params=[
                    'startId'   => 0
                    ,'where'    => '{"template":6}'
                    ]}
                </ul>
            </div>

            <div class="col s24 l17">

                {include file="components/_breadcrumbs.tpl"}
                <h1>{field name=pagetitle}</h1>

                {$price = {tv name=price}}

                {if $price}

                    <div class="order-alert">
                        <div class="row row--grid">
                            <div class="col s24 m12 valign-wrapper">
                                <div class="wrapper price--area">
                                    Стоимость:
                                    {if {tv name=isfrom}}
                                     от
                                    {/if}
                                    <span class="order-alert__price">{$price|number_format:0:",":" "}</span> рублей
                                </div>
                            </div>
                            <div class="col s24 m12 valign-wrapper">
                                <div class="wrapper">
                                    <a href="#order" class="btn link--scroller">Заказать</a>
                                </div>
                            </div>
                        </div>
                    </div>

                {/if}

                <article class="content-wrapper">
                    {field name=content}
                </article>
            </div>

        </div>

    </div>

{/block}