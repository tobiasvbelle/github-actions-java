package com.example.devopstraining.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api")
public final class HelloController {

    @GetMapping("/hello")
    public String hello() {
        return "Hello, DevOps Training!";
    }

    @GetMapping("/hello/{name}")
    public String helloWithName(@PathVariable final String name) {
        return "Hello, " + name + "!";
    }

    @GetMapping("/health")
    public String health() {
        return "Application is running";
    }
}
