import "@typespec/http";
import "@typespec/rest";
import "./agent.tsp";

using TypeSpec.Http;
using TypeSpec.Rest;

@service({
  title: "Homeease API",
  version: "1.0.0",
})
namespace HomeEase;

using AgentService;

@route("/test")
@tag("Test")
interface Tests {
  @get read(@path id: string): string;
}

@route("/agents")
@tag("Agent")
Agents;