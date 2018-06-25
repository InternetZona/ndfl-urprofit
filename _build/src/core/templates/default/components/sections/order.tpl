<div id="order" class="section grey lighten-4">
    <div class="container">
        <div class="section__title h2 center-align red-text">Заказать услугу</div>
        <div class="tabs-wrapper white">
            <div class="row">
                <ul id="order-tabs" class="tabs hide">
                    <li class="tab"><a href="#tab1">Шаг 1</a></li>
                    <li class="tab"><a href="#tab2">Шаг 2</a></li>
                    <li class="tab"><a href="#tab3">Заказ оформлен</a></li>
                </ul>
                <div id="tab1" class="col s24">
                    <div class="fieldset" data-legend="Шаг 1">
                        {include file="components/form/preorder.tpl"}
                    </div>
                </div>
                <div id="tab2" class="col s24">
                    <div class="fieldset" data-legend="Шаг 2">

                        {$tvServicesOrder = false}
                        {$tvOptionsOrder = false}

                        {if {field name=id} == 1}

                            {$tvServicesOrder = {tv name=servicesOrder}|json_decode:true}
                            {$tvOptionsOrder = {tv name=optionsOrder}|json_decode:true}

                        {else}

                            {if $page = $modx->getObject('modResource', 1)}

                                {$tvServicesOrder = $page->getTVValue('servicesOrder')|json_decode:true}
                                {$tvOptionsOrder = $page->getTVValue('optionsOrder')|json_decode:true}

                            {/if}

                        {/if}


                        {if $tvServicesOrder}

                            {include file="components/form/order.tpl" services=$tvServicesOrder options=$tvOptionsOrder}

                        {else}

                            <div class="order--alert alert--info">
                                <p>
                                    В данный момент заказы услуг недоступны.<br>
                                    В ближайшее время с вами свяжется наш менеджер.
                                </p>
                            </div>

                        {/if}
                    </div>
                </div>
                <div id="tab3" class="col s24">
                    <div class="fieldset" data-legend="Заказ оформлен">
                        <div class="order-alert__success">
                            <div class="h4 center-align text--bold" style="text-transform: uppercase;">Спасибо за заказ!</div>
                            <div class="h6 center-align text--bold">В ближайшее время с вами свяжется наш менеджер.</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>