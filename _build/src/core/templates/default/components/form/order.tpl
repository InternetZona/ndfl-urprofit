{$key = rand()}

<form id="order-calc" class="form" data-validate="order" name="order">
    <input type="hidden" name="action" value="web/form">
    <input type="hidden" name="subject" value="Шаг 2. Оформление заказа.">
    <div class="input-field">
        <div class="text--bold">Выбор услуги:</div>
        <div class="input-field-group">

            {foreach $services as $service}
                <label for="type-option-{$service.MIGX_id}" class="btn-checkbox">
                    <input id="type-option-{$service.MIGX_id}" name="type[]" type="checkbox" data-price="{$service.price|default:0}" data-id="{$service.MIGX_id}" value="{$service.title}">

                    {if $service.description}

                        <span class="tooltipped" data-position="bottom" data-delay="50" data-tooltip="{$service.description}">{$service.title}</span>

                        {else}

                        <span>{$service.title}</span>

                    {/if}

                </label>
            {/foreach}

        </div>
    </div>

    <div class="row">
        <div class="input-field col s24 m12">
            {if $options}
                <div class="text--bold">Способ доставки:</div>
                <div class="input-field-group">

                    {foreach $options as $option}
                        <p>
                            <label>
                                <input class="with-gap" name="delivery" type="radio" data-price="{$option.price|default:0}" value="{$option.title}"  />
                                <span>{$option.title}</span>
                            </label>
                        </p>
                    {/foreach}

                </div>
            {/if}
            <div class="input-field">
                <textarea id="comment-{$key}" name="comment" class="materialize-textarea"></textarea>
                <label for="comment-{$key}" style="left:0;">Комментарий</label>
            </div>
        </div>
        <div class="col s24 m12">
            <!--
            <div class="text--bold">Прикрепить файлы:</div>
            <div class="input-field-group"></div>
            -->
        </div>
    </div>

    <ul class="order-summary">
        <li class="order-summary__price">Общая стоимость: <span>0</span> рублей</li>
        <li class="order-summary__discount">С учетом скидки: <span>0</span> рублей</li>
        <li class="order-summary__alert">С вами свяжется наш консультант, чтобы уточнить услугу и стоимость</li>
    </ul>

    <div class="row">
        <div class="col s24 m12">

            <p class="small">
                * Стоимость за 1 год. На каждый год нужно оформлять отдельный заказ.
            </p>
        </div>
        <div class="col s24 m12">

            <div class="center-align">
                <button type="submit" class="btn">Заказать</button>
            </div>
        </div>
    </div>

</form>

