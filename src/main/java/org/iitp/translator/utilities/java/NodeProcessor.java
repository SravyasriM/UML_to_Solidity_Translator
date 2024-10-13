package org.iitp.translator.utilities.java;

import com.github.javaparser.ast.Node;
import org.json.JSONObject;

import java.io.IOException;
import java.util.Map;

public interface NodeProcessor {

    JSONObject callRelevantMethod(Map<String, NodeProcessor> stringNodeProcessorMap,
                                  Node node, JSONObject mapper) throws IOException;
}
