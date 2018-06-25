{$params=[
    'id'     => 19
    ,'current'  => true
    ,'showhidden'   => true
    ,'cache'    => true
]}

{processor action="site/web/resources/getdata" ns="modxsite" params=$params assign=result}

{if $result.success && $result.count > 0}

    {if $testimonials = $result.object.tvs.testimonials.value|json_decode:true}

        <div class="section container">

            <div class="section__title center-align h2">
                {$result.object.pagetitle}
            </div>

            <div class="swiper-container swiper-testimonials" data-config="testimonials">
                <div class="swiper-wrapper">
                    {foreach $testimonials as $data}
                        <div class="swiper-slide">
                            <div class="card card--testimonials">
                                <div class="card-content">
                                    <div class="card-title">
                                        {$data.client}

                                        {if $service = $modx->getObject('modResource', $data.service_id)}

                                            <small>{$service->menutitle|default:$service->pagetitle}</small>

                                        {/if}

                                    </div>
                                    <p>{$data.text}</p>
                                </div>
                            </div>
                        </div>
                    {/foreach}
                </div>
                <div class="swiper-button-prev"></div>
                <div class="swiper-button-next"></div>
            </div>
        </div>

    {/if}

{/if}