package com.etco.model;

import org.slim3.tester.AppEngineTestCase;
import org.junit.Test;
import static org.junit.Assert.*;
import static org.hamcrest.CoreMatchers.*;

public class PageTest extends AppEngineTestCase {

    private SitePage model = new SitePage();

    @Test
    public void test() throws Exception {
        assertThat(model, is(notNullValue()));
    }
}
