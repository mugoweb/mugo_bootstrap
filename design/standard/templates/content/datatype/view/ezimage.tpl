{*
Input:
 css_classes
 image_alias
*}

{if is_unset( $image_alias )}
	{def $image_alias = 'large'}
{/if}
{if is_unset( $css_classes )}
	{def $css_classes = array()}
{/if}


{def $image_content = $attribute.content}

{if $image_content.is_valid}

	{def $image = $image_content[ $image_alias ]}

	{if and( is_set( $image ), $image )}

		{if $alt_text|not}
			{if $image.text}
				{set $alt_text = $image.text}
			{else}
				{set $alt_text = $attribute.object.name}
			{/if}
		{/if}

		{if $title|not}
			{set $title = $alt_text}
		{/if}

		<img
				class="{$css_classes|implode( ' ' )}"
				src="{$image.url|ezroot( 'no' )}"
				alt="{$alt_text|wash(xhtml)}"
				title="{$title|wash(xhtml)}"
		/>
	{/if}
{/if}
