package com.etco.model;

import org.slim3.tester.AppEngineTestCase;
import org.junit.Test;
import static org.junit.Assert.*;
import static org.hamcrest.CoreMatchers.*;

public class ListItemTest extends AppEngineTestCase {

    private ListItem model = new ListItem();

    @Test
    public void test() throws Exception {
        assertThat(model, is(notNullValue()));
    }
}
