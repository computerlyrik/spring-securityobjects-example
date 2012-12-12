# Description
Example project for spring-securityobjects library.

- Demonstates forwarding on User Role,
- demonstrates jsf login forms and
- features 1:n relationships (yeah!)

# Usage
/path/to/maven3 jetty:run

# Configuration
Configure landing pages set up a map-like structure in applicationContext.
Pass configuration to Handler bean

```xml
        <beans:bean name="landingPages" class="java.util.HashMap">
                <beans:constructor-arg index="0">
                        <beans:map>
                                <beans:entry key="ROLE_ADMIN">
                                        <beans:value>/admin.jsf</beans:value>
                                </beans:entry>
                        </beans:map>
                </beans:constructor-arg>
        </beans:bean>

    <beans:bean class="de.computerlyrik.spring.securityobjects.example.web.security.AuthenticationSuccessHandler" id="userRoleAuthSuccessHandler">
                <beans:property name="landingPages">
                <beans:ref bean="landingPages"/>
        </beans:property>
    </beans:bean>

```

