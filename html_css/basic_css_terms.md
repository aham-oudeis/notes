# Basic CSS terms

Cascading Style Sheets are generally used for presentation of the document.

## Selectors

A selector picks out exactly which element or elements within our HTML to target and apply styles (such as color, size, and position) to. Selectors may include a combination of different qualifiers to select unique elements, all depending on how specific we wish to be. For example, we may want to select every paragraph on a page, or we may want to select only one specific paragraph on a page.

## Properties

Properties define the specific stylistic thing applied to the element. Property names fall after a selector, within the curly brackets, {}, and immediately preceding a colon, :. 

`p { font-family: ... }`

Here, `font-family` is the property

## Values

Value fixes the behavior of the property.

`p { font-family: Verdana }`

## Combining Selectors
When selectors are combined, the selectors are read from right to left:
* Key selector: the rightmost selector before the left-curly brace `{`
* Prequalifier: the selector on the left side is called prequalifier

It seems the hierarchy flows from left to right. The left selector covers more elements than the right selector. But this might not be true.

<p>
	This is an introductory paragraph.
</p>
<p class="conclusion">
	This is the conclusion for the section.
</p>

What's the difference between `.conclusion p {}` and `p.conclusion {}`?