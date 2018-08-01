{$params=[
    'id'    => 10
    ,'current'  => true
    ,'cached'   => true
]}

{processor action="site/web/resources/getdata" ns="modxsite" params=$params assign=result}

{if $result.success && $result.count > 0}

    {if $steps = $result.object.tvs.steps.value|json_decode:true}

        <div class="section parallax-container">
            {snippet name="pThumb" params=[
            "input" => $result.object.tvs.image.value
            ,"options" => "&w=1920&h=1080&zc=1&aoe=0&far=0&q=80"
            ] assign=imageThumb}
            <div class="parallax"><img src="{$imageThumb}"></div>

            <div class="container">

                <div class="row">
                    <div class="col s24 m18 l12">
                        <div class="section__title h2 center-align white-text">
                            Как получить вычет
                        </div>
                        <ul class="list-steps collection style--inverse">

                            {foreach $steps as $data}

                                <li class="collection-item avatar">
                    <span class="circle">
                        {$data@index + 1}
                    </span>
                                    <p>
                                        {$data.text}
                                    </p>
                                </li>

                            {/foreach}

                        </ul>
                    </div>
                </div>

            </div>
        </div>

    {/if}

{/if}