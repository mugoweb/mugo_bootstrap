{if is_unset( $css_classes )}
	{def $css_classes = array( 'img-fluid' )}
{/if}

{* add 	$classification to css_classes *}

{if $object_parameters[ 'align' ]}
    {if eq( $object_parameters[ 'align' ], 'center' )}
        {set $css_classes = $css_classes|append( 'text-center' )}
    {else}
        {set $css_classes = $css_classes|append( concat( 'float-', $object_parameters[ 'align' ] ) )}
    {/if}
{/if}

<div
	class="{$css_classes|implode( ' ' )}{if ne($classification|trim,'')} {$classification|wash}{/if}"
	{if is_set($object_parameters.id)}id="{$object_parameters.id}"{/if}
>{content_view_gui
	view=$view
	link_parameters=$link_parameters
	object_parameters=$object_parameters
	content_object=$object
    css_classes=$css_classes
}</div>