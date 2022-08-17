[HTTP Terms](http.md)  || [Stateful Applications](stateful_applications.md) || [HTTP Life Cyle](http_life_cycle.md) || [TLS](transport_layer_security.md)

## Security Threats

Since HTTP is a stateless protocol, application employ varieties of techniques to simulate stateful application. These techniques introduce new vulnerabilities. There are two major forms of security threats that we need to know about:

1. __Session Hijacking__ (perhaps through packet sniffing)
 * This type of attack happens when an attacker gets acceess to the session id and thus is able to access the sensitive information without having to login in. 
   __Solutions__

   * Resetting sessions
   * Expiration of sessions
   * Using HTTPs

2. __Cross-Site Scripting__ (XSS)
    * This type of attack happens when you allow users to input HTML or JavaScript that ends up being displayed by the site directly.
  Solutions
    * Input sanitization. Use markdown
    * Escape all user data when displaying it.