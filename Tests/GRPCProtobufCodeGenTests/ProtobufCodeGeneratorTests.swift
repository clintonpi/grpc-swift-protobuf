/*
 * Copyright 2024, gRPC Authors All rights reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#if os(macOS) || os(Linux)  // swift-format doesn't like canImport(Foundation.Process)

import GRPCCodeGen
import GRPCProtobufCodeGen
import SwiftProtobuf
import SwiftProtobufPluginLibrary
import XCTest

final class ProtobufCodeGeneratorTests: XCTestCase {
  func testProtobufCodeGenerator() throws {
    try testCodeGeneration(
      indentation: 4,
      visibility: .internal,
      client: true,
      server: false,
      expectedCode: """
        // Copyright 2015 gRPC authors.
        //
        // Licensed under the Apache License, Version 2.0 (the "License");
        // you may not use this file except in compliance with the License.
        // You may obtain a copy of the License at
        //
        //     http://www.apache.org/licenses/LICENSE-2.0
        //
        // Unless required by applicable law or agreed to in writing, software
        // distributed under the License is distributed on an "AS IS" BASIS,
        // WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
        // See the License for the specific language governing permissions and
        // limitations under the License.

        // DO NOT EDIT.
        // swift-format-ignore-file
        //
        // Generated by the gRPC Swift generator plugin for the protocol buffer compiler.
        // Source: helloworld.proto
        //
        // For information on using the generated types, please see the documentation:
        //   https://github.com/grpc/grpc-swift

        import GRPCCore
        import GRPCProtobuf

        internal enum Helloworld {
            internal enum Greeter {
                internal enum Method {
                    internal enum SayHello {
                        internal typealias Input = HelloRequest
                        internal typealias Output = HelloReply
                        internal static let descriptor = MethodDescriptor(
                            service: "helloworld.Greeter",
                            method: "SayHello"
                        )
                    }
                    internal static let descriptors: [MethodDescriptor] = [
                        Helloworld.Greeter.Method.SayHello.descriptor
                    ]
                }
                internal typealias ClientProtocol = Helloworld_GreeterClientProtocol
                internal typealias Client = Helloworld_GreeterClient
            }
        }

        /// The greeting service definition.
        internal protocol Helloworld_GreeterClientProtocol: Sendable {
            /// Sends a greeting.
            func sayHello<R>(
                request: ClientRequest.Single<Helloworld.Greeter.Method.SayHello.Input>,
                serializer: some MessageSerializer<Helloworld.Greeter.Method.SayHello.Input>,
                deserializer: some MessageDeserializer<Helloworld.Greeter.Method.SayHello.Output>,
                _ body: @Sendable @escaping (ClientResponse.Single<Helloworld.Greeter.Method.SayHello.Output>) async throws -> R
            ) async throws -> R where R: Sendable
        }

        extension Helloworld.Greeter.ClientProtocol {
            internal func sayHello<R>(
                request: ClientRequest.Single<Helloworld.Greeter.Method.SayHello.Input>,
                _ body: @Sendable @escaping (ClientResponse.Single<Helloworld.Greeter.Method.SayHello.Output>) async throws -> R
            ) async throws -> R where R: Sendable {
                try await self.sayHello(
                    request: request,
                    serializer: ProtobufSerializer<Helloworld.Greeter.Method.SayHello.Input>(),
                    deserializer: ProtobufDeserializer<Helloworld.Greeter.Method.SayHello.Output>(),
                    body
                )
            }
        }

        /// The greeting service definition.
        internal struct Helloworld_GreeterClient: Helloworld.Greeter.ClientProtocol {
            private let client: GRPCCore.GRPCClient
            
            internal init(client: GRPCCore.GRPCClient) {
                self.client = client
            }
            
            /// Sends a greeting.
            internal func sayHello<R>(
                request: ClientRequest.Single<Helloworld.Greeter.Method.SayHello.Input>,
                serializer: some MessageSerializer<Helloworld.Greeter.Method.SayHello.Input>,
                deserializer: some MessageDeserializer<Helloworld.Greeter.Method.SayHello.Output>,
                _ body: @Sendable @escaping (ClientResponse.Single<Helloworld.Greeter.Method.SayHello.Output>) async throws -> R
            ) async throws -> R where R: Sendable {
                try await self.client.unary(
                    request: request,
                    descriptor: Helloworld.Greeter.Method.SayHello.descriptor,
                    serializer: serializer,
                    deserializer: deserializer,
                    handler: body
                )
            }
        }
        """
    )

    try testCodeGeneration(
      indentation: 2,
      visibility: .public,
      client: false,
      server: true,
      expectedCode: """
        // Copyright 2015 gRPC authors.
        //
        // Licensed under the Apache License, Version 2.0 (the "License");
        // you may not use this file except in compliance with the License.
        // You may obtain a copy of the License at
        //
        //     http://www.apache.org/licenses/LICENSE-2.0
        //
        // Unless required by applicable law or agreed to in writing, software
        // distributed under the License is distributed on an "AS IS" BASIS,
        // WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
        // See the License for the specific language governing permissions and
        // limitations under the License.

        // DO NOT EDIT.
        // swift-format-ignore-file
        //
        // Generated by the gRPC Swift generator plugin for the protocol buffer compiler.
        // Source: helloworld.proto
        //
        // For information on using the generated types, please see the documentation:
        //   https://github.com/grpc/grpc-swift

        import GRPCCore
        import GRPCProtobuf

        public enum Helloworld {
          public enum Greeter {
            public enum Method {
              public enum SayHello {
                public typealias Input = HelloRequest
                public typealias Output = HelloReply
                public static let descriptor = MethodDescriptor(
                  service: "helloworld.Greeter",
                  method: "SayHello"
                )
              }
              public static let descriptors: [MethodDescriptor] = [
                Helloworld.Greeter.Method.SayHello.descriptor
              ]
            }
            public typealias StreamingServiceProtocol = Helloworld_GreeterStreamingServiceProtocol
            public typealias ServiceProtocol = Helloworld_GreeterServiceProtocol
          }
        }

        /// The greeting service definition.
        public protocol Helloworld_GreeterStreamingServiceProtocol: GRPCCore.RegistrableRPCService {
          /// Sends a greeting.
          func sayHello(request: ServerRequest.Stream<Helloworld.Greeter.Method.SayHello.Input>) async throws -> ServerResponse.Stream<Helloworld.Greeter.Method.SayHello.Output>
        }

        /// Conformance to `GRPCCore.RegistrableRPCService`.
        extension Helloworld.Greeter.StreamingServiceProtocol {
          public func registerMethods(with router: inout GRPCCore.RPCRouter) {
            router.registerHandler(
              forMethod: Helloworld.Greeter.Method.SayHello.descriptor,
              deserializer: ProtobufDeserializer<Helloworld.Greeter.Method.SayHello.Input>(),
              serializer: ProtobufSerializer<Helloworld.Greeter.Method.SayHello.Output>(),
              handler: { request in
                try await self.sayHello(request: request)
              }
            )
          }
        }

        /// The greeting service definition.
        public protocol Helloworld_GreeterServiceProtocol: Helloworld.Greeter.StreamingServiceProtocol {
          /// Sends a greeting.
          func sayHello(request: ServerRequest.Single<Helloworld.Greeter.Method.SayHello.Input>) async throws -> ServerResponse.Single<Helloworld.Greeter.Method.SayHello.Output>
        }

        /// Partial conformance to `Helloworld_GreeterStreamingServiceProtocol`.
        extension Helloworld.Greeter.ServiceProtocol {
          public func sayHello(request: ServerRequest.Stream<Helloworld.Greeter.Method.SayHello.Input>) async throws -> ServerResponse.Stream<Helloworld.Greeter.Method.SayHello.Output> {
            let response = try await self.sayHello(request: ServerRequest.Single(stream: request))
            return ServerResponse.Stream(single: response)
          }
        }
        """
    )
    try testCodeGeneration(
      indentation: 2,
      visibility: .package,
      client: true,
      server: true,
      expectedCode: """
        // Copyright 2015 gRPC authors.
        //
        // Licensed under the Apache License, Version 2.0 (the "License");
        // you may not use this file except in compliance with the License.
        // You may obtain a copy of the License at
        //
        //     http://www.apache.org/licenses/LICENSE-2.0
        //
        // Unless required by applicable law or agreed to in writing, software
        // distributed under the License is distributed on an "AS IS" BASIS,
        // WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
        // See the License for the specific language governing permissions and
        // limitations under the License.

        // DO NOT EDIT.
        // swift-format-ignore-file
        //
        // Generated by the gRPC Swift generator plugin for the protocol buffer compiler.
        // Source: helloworld.proto
        //
        // For information on using the generated types, please see the documentation:
        //   https://github.com/grpc/grpc-swift

        import GRPCCore
        import GRPCProtobuf

        package enum Helloworld {
          package enum Greeter {
            package enum Method {
              package enum SayHello {
                package typealias Input = HelloRequest
                package typealias Output = HelloReply
                package static let descriptor = MethodDescriptor(
                  service: "helloworld.Greeter",
                  method: "SayHello"
                )
              }
              package static let descriptors: [MethodDescriptor] = [
                Helloworld.Greeter.Method.SayHello.descriptor
              ]
            }
            package typealias StreamingServiceProtocol = Helloworld_GreeterStreamingServiceProtocol
            package typealias ServiceProtocol = Helloworld_GreeterServiceProtocol
            package typealias ClientProtocol = Helloworld_GreeterClientProtocol
            package typealias Client = Helloworld_GreeterClient
          }
        }

        /// The greeting service definition.
        package protocol Helloworld_GreeterStreamingServiceProtocol: GRPCCore.RegistrableRPCService {
          /// Sends a greeting.
          func sayHello(request: ServerRequest.Stream<Helloworld.Greeter.Method.SayHello.Input>) async throws -> ServerResponse.Stream<Helloworld.Greeter.Method.SayHello.Output>
        }

        /// Conformance to `GRPCCore.RegistrableRPCService`.
        extension Helloworld.Greeter.StreamingServiceProtocol {
          package func registerMethods(with router: inout GRPCCore.RPCRouter) {
            router.registerHandler(
              forMethod: Helloworld.Greeter.Method.SayHello.descriptor,
              deserializer: ProtobufDeserializer<Helloworld.Greeter.Method.SayHello.Input>(),
              serializer: ProtobufSerializer<Helloworld.Greeter.Method.SayHello.Output>(),
              handler: { request in
                try await self.sayHello(request: request)
              }
            )
          }
        }

        /// The greeting service definition.
        package protocol Helloworld_GreeterServiceProtocol: Helloworld.Greeter.StreamingServiceProtocol {
          /// Sends a greeting.
          func sayHello(request: ServerRequest.Single<Helloworld.Greeter.Method.SayHello.Input>) async throws -> ServerResponse.Single<Helloworld.Greeter.Method.SayHello.Output>
        }

        /// Partial conformance to `Helloworld_GreeterStreamingServiceProtocol`.
        extension Helloworld.Greeter.ServiceProtocol {
          package func sayHello(request: ServerRequest.Stream<Helloworld.Greeter.Method.SayHello.Input>) async throws -> ServerResponse.Stream<Helloworld.Greeter.Method.SayHello.Output> {
            let response = try await self.sayHello(request: ServerRequest.Single(stream: request))
            return ServerResponse.Stream(single: response)
          }
        }

        /// The greeting service definition.
        package protocol Helloworld_GreeterClientProtocol: Sendable {
          /// Sends a greeting.
          func sayHello<R>(
            request: ClientRequest.Single<Helloworld.Greeter.Method.SayHello.Input>,
            serializer: some MessageSerializer<Helloworld.Greeter.Method.SayHello.Input>,
            deserializer: some MessageDeserializer<Helloworld.Greeter.Method.SayHello.Output>,
            _ body: @Sendable @escaping (ClientResponse.Single<Helloworld.Greeter.Method.SayHello.Output>) async throws -> R
          ) async throws -> R where R: Sendable
        }

        extension Helloworld.Greeter.ClientProtocol {
          package func sayHello<R>(
            request: ClientRequest.Single<Helloworld.Greeter.Method.SayHello.Input>,
            _ body: @Sendable @escaping (ClientResponse.Single<Helloworld.Greeter.Method.SayHello.Output>) async throws -> R
          ) async throws -> R where R: Sendable {
            try await self.sayHello(
              request: request,
              serializer: ProtobufSerializer<Helloworld.Greeter.Method.SayHello.Input>(),
              deserializer: ProtobufDeserializer<Helloworld.Greeter.Method.SayHello.Output>(),
              body
            )
          }
        }

        /// The greeting service definition.
        package struct Helloworld_GreeterClient: Helloworld.Greeter.ClientProtocol {
          private let client: GRPCCore.GRPCClient
          
          package init(client: GRPCCore.GRPCClient) {
            self.client = client
          }
          
          /// Sends a greeting.
          package func sayHello<R>(
            request: ClientRequest.Single<Helloworld.Greeter.Method.SayHello.Input>,
            serializer: some MessageSerializer<Helloworld.Greeter.Method.SayHello.Input>,
            deserializer: some MessageDeserializer<Helloworld.Greeter.Method.SayHello.Output>,
            _ body: @Sendable @escaping (ClientResponse.Single<Helloworld.Greeter.Method.SayHello.Output>) async throws -> R
          ) async throws -> R where R: Sendable {
            try await self.client.unary(
              request: request,
              descriptor: Helloworld.Greeter.Method.SayHello.descriptor,
              serializer: serializer,
              deserializer: deserializer,
              handler: body
            )
          }
        }
        """
    )
  }

  func testCodeGeneration(
    indentation: Int,
    visibility: SourceGenerator.Configuration.AccessLevel,
    client: Bool,
    server: Bool,
    expectedCode: String
  ) throws {
    let configs = SourceGenerator.Configuration(
      accessLevel: visibility,
      client: client,
      server: server,
      indentation: indentation
    )
    let descriptorSet = DescriptorSet(protos: [Google_Protobuf_FileDescriptorProto.helloWorld])
    guard let fileDescriptor = descriptorSet.fileDescriptor(named: "helloworld.proto") else {
      return XCTFail(
        """
        Could not find the file descriptor of "helloworld.proto".
        """
      )
    }
    let generator = ProtobufCodeGenerator(configuration: configs)
    try XCTAssertEqualWithDiff(try generator.generateCode(from: fileDescriptor), expectedCode)
  }
}

private func diff(expected: String, actual: String) throws -> String {
  let process = Process()
  process.executableURL = URL(fileURLWithPath: "/usr/bin/env")
  process.arguments = [
    "bash", "-c",
    "diff -U5 --label=expected <(echo '\(expected)') --label=actual <(echo '\(actual)')",
  ]
  let pipe = Pipe()
  process.standardOutput = pipe
  try process.run()
  process.waitUntilExit()
  let pipeData = try XCTUnwrap(
    pipe.fileHandleForReading.readToEnd(),
    """
    No output from command:
    \(process.executableURL!.path) \(process.arguments!.joined(separator: " "))
    """
  )
  return String(decoding: pipeData, as: UTF8.self)
}

internal func XCTAssertEqualWithDiff(
  _ actual: String,
  _ expected: String,
  file: StaticString = #filePath,
  line: UInt = #line
) throws {
  if actual == expected { return }
  XCTFail(
    """
    XCTAssertEqualWithDiff failed (click for diff)
    \(try diff(expected: expected, actual: actual))
    """,
    file: file,
    line: line
  )
}

#endif  // os(macOS) || os(Linux)
