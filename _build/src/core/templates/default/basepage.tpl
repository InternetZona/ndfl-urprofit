{extends file="tpl/index.tpl"}

{block name=body}

    <div class="container">
        {include file="components/_breadcrumbs.tpl"}
        <h1>{field name=pagetitle}</h1>

        {block name=content}
            <article class="content-wrapper">
                {field name=content}
            </article>
        {/block}


    </div>

{/block}