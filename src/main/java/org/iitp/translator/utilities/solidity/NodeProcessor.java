package org.iitp.translator.utilities.solidity;

import org.json.JSONObject;

import java.util.Map;

public interface NodeProcessor {

    String callRelevantMethod(Map<String, NodeProcessor> stringNodeProcessorMap,
                              JSONObject node, int tab_count);
}
