## Handlebars

Summary:
1. Handlebars takes a template with the variables and compiles it into a function
2. This function is then executed by passing a JSON object as an argument. This object is known as context and it contains the values of the variables used in the template.
3. On its execution, the function returns the requred HTML after replacing the variables of the template with their corresponding values.

Templates can be written either as in the HTML or in a separate file.

When the template is written in the HTML:

```html
<script id='handlebars-test' type='text/x-handlebars-template'>
<div>
	<p>This is a test for {{name}}</p>
</div>
</script>
```

Inside the javascript, we can get hold of this script and extract the text within. For that purpose, we can simply use the id attribute.

To compile it, we pass the template through the `compile` static method on `Handlebar` as:

```javascript
let testTemplate = document.getElementById('handlebars-test');

let templateFunc = Handlebars.compile(testTemplate);

```

`Handlebars.compile` returns a closure that has access to the testTemplate. We can then pass the object to the function to replace all the references to the properties of the object present inside the two curly braces.

```javascript
let html = templateFunc({name: 'a test for Handlebars'});
let text = document.createElement('p');
text.textContent = html;
document.appendChild(text);
```

### Syntaxes

#### HTML Escaping

Handlebars escapes the value returned by an expression, such that the value passed in is treated as given.

However, if you want to not escape the value and read the values as tags, then you'd have to enclose the value in three curly braces

#### Comment

Handlebars can be told to take some value as a comment by enclosing the value with `{{!--value--}}`. That way, handlebars knows not to render the value.

#### Blocks 

Blocks are expressions that have a block opening `{{#}}` and closing `{{/}}`
	-if block 
```pug
{{#if boolen}}
	Some content
{{/if}}
```