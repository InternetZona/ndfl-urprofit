{extends file="emails/base.tpl"}

{block name=body}

    {block name=client}

        {include file="emails/constructor/title.tpl" text="Информация от пользователя сайта"}
        {include file="emails/constructor/client.tpl"}

    {/block}

    {block name=content}{/block}

{/block}