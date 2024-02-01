import "@typespec/http";
import "@typespec/rest";

using TypeSpec.Http;
using TypeSpec.Rest;

namespace AgentService;

model Agent {
  @visibility("read", "update")
  @path
  id: string;
  name: string;
  email: string
}

@error
model Error {
  @statusCode statusCode: 500;

  message: string;
}

model Paginated<T> {
  data: T[];
  meta: {
    page: int64;
    perPage: int64;
    total: int64;
  }
}

@route("/agents")
@tag("Agents")
interface Agents {
  @get list(): Paginated<Agent> | Error;
  @get read(@path id: string): Agent | Error;
  @post create(...Agent): Agent | Error;
  @patch update(...Agent): Agent | Error;
  @delete delete(@path id: string): void | Error;
  @route("{id}/analyze") @post analyze(@path id: string): string | Error;
}
