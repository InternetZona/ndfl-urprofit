{extends file="tpl/index.tpl"}

{block name=body}

    <div class="section container">

        <div class="section__title center-align">
            <h1>{field name=pagetitle}</h1>
        </div>

        <div class="row">
            <div class="col s24 m24 l24 offset-xl2 xl20">
                <div class="content-wrapper">
                    {field name=content}
                </div>
            </div>
        </div>

        {include file="components/sections/service.tpl"}

    </div>

    {include file="components/sections/price.tpl"}

    <div class="container">
        {include file="components/sections/featured.tpl"}
        <div class="row">
            <div class="col s24 m24 l24 offset-xl2 xl20">
                <div class="content-wrapper">
                    {tv name=textbox1}
                </div>
            </div>
        </div>
    </div>

    {include file="components/sections/howto.tpl"}

    <div class="container">
        <div class="row">
            <div class="col s24 m24 l24 offset-xl2 xl20">
                <div class="content-wrapper">
                    {tv name=textbox2}
                </div>
            </div>
        </div>
    </div>

    {include file="components/sections/order.tpl"}

    <div class="container">
        <div class="row">
            <div class="col s24 m24 l24 offset-xl2 xl20">
                <div class="content-wrapper">
                    {tv name=textbox3}
                </div>
            </div>
        </div>
    </div>

{/block}

{block name=order}{/block}

{block name=testimonials}
    {include file="components/sections/testimonials.tpl"}
{/block}