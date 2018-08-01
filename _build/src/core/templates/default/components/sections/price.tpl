{$params=[
    'id'    => 7
    ,'current'  => true
]}

{processor action="site/web/resources/getdata" ns="modxsite" params=$params assign=result}

{if $result.success && $result.count > 0}

    {if $priceList = $result.object.tvs.priceList.value|json_decode:true}

        <div class="section parallax-container">
            {snippet name="pThumb" params=[
                "input" => $result.object.tvs.image.value
                ,"options" => "&w=1920&h=1080&zc=1&aoe=0&far=0&q=80"
            ] assign=imageThumb}
            <div class="parallax"><img src="{$imageThumb}"></div>

            <div class="container">
                <div class="section__title h2 center-align white-text">
                    Цены
                </div>

                <div class="row">
                    <div class="col s24 offset-l2 l20">
                        <div class="table-wrapper z-depth-3 white">
                            <table class="table highlight">
                                <thead>
                                <tr>
                                    <th>Тип услуги</th>
                                    <th class="center-align">Цена</th>
                                </tr>
                                </thead>
                                <tbody>

                                {foreach $priceList as $data}

                                    <tr>
                                        <td>
                                            {if $data.service_id}
                                                <a href="{$modx->makeUrl($data.service_id)}">{$data.title}</a>

                                            {else}
                                                {$data.title}

                                            {/if}
                                        </td>
                                        <td class="center-align">

                                            {$cost = 'бесплатно'}

                                            {if $data.service_id}

                                                {if $object = $modx->getObject('modResource', $data.service_id)}

                                                    {if $price = $object->getTVValue('price')}

                                                        {if $object->getTVValue('isfrom')}
                                                            {$cost = "от {$price|number_format:0:',':' '} руб"}
                                                        {else}
                                                            {$cost = "{$price|number_format:0:',':' '} руб"}
                                                        {/if}

                                                    {/if}
                                                {/if}

                                            {elseif $data.price}

                                                {if $data.isfrom}
                                                    {$cost = "от {$data.price|number_format:0:',':' '} руб"}
                                                {else}
                                                    {$cost = "{$data.price|number_format:0:',':' '} руб"}
                                                {/if}

                                            {/if}

                                            {$cost}


                                        </td>
                                    </tr>

                                {/foreach}

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

            </div>
        </div>

    {/if}

{/if}