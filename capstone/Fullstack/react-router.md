## React-Router
`npm install react-router-dom`

- returning to react without redux
- navigation bar for switching the view of the application

Implementing single page application comes with some drawbacks:
> However, the method (of using single page apps) is not very optimal. As we can see from the pictures, the address stays the same even though at times we are in different views. Each view should preferably have its own address, e.g. to make bookmarking possible. The _back_-button doesn't work as expected for our application either, meaning that _back_ doesn't move you to the previously displayed view of the application, but somewhere completely different. If the application were to grow even bigger and we wanted to, for example, add separate views for each user and note, then this self-made _routing_, which means the navigation management of the application, would get overly complicated.

## Router Organization
```jsx
import {
BrowserRouter as Router,
Routes, Route, Link
} from "react-router-dom"

const App = () => {
//...some details

return (
<Router> //this is the main enclosing component
//we then create a place for links
	<div>
		<Link to="/">Home</Link>
		<Link to="/contacts">Contacts</Link>
	</div>

//we then specify where the link takes us with Routes
//routes:w
are specified as a list of route that corresponds with the links
<Routes>
//for each link, we specify the route that react is supposed to follow. Single route is a self-closing tag
<Route path="/contacts" element={<Contacts />} />
<Route path="/" element={<Home />} />
</Routes>
</Router>
)
}
```

Basically, the `Link` tag contains `to` attribute, and `Route` tag contains the `element` and `path` attributes. The value of the `path` attribute matches the value of the `to` attribute from the `Link` tag.

> _BrowserRouter_ is a _Router_ that uses the HTML5 history API (pushState, replaceState and the popState event) to keep your UI in sync with the URL.

![[Pasted image 20220728121407.png]]

The Routes work by rendering the first component whose __path__ matches the url in the browser's address bar.

### Parametrized Route
- How to route to different resources based on the params?

### Hooks for routing
`useParams` : returns an object with `id` property
`useNavigate` : returns a function that takes the route as an argument
`useMatch`
have to be imported along with the Router and Routes

- It is not possible to use the `useMatch` hook in the component which defines the routed part of the application. That is, the `useMatch` can only be used from the components that are nested within the `Router` component. That means, if `App` uses the `Router` component, then `useMatch` cannot be used in the same component.
![[Pasted image 20220728123053.png]]
