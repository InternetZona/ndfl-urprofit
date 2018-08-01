{extends file="basepage.tpl"}

{block name=content prepend}

    {$tvData = {tv name=steps}|json_decode:true}

    {if $tvData}

        <ul class="list-steps collection">

            {foreach $tvData as $data}

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

    {/if}

{/block}