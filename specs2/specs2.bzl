load(
    "//scala:scala_cross_version.bzl",
    _default_scala_version = "default_scala_version",
    _extract_major_version = "extract_major_version",
    _scala_mvn_artifact = "scala_mvn_artifact",
)
load(
    "@io_bazel_rules_scala//scala:scala_maven_import_external.bzl",
    _scala_maven_import_external = "scala_maven_import_external",
)

def specs2_version():
    return "4.3.6"

def specs2_repositories(
        scala_version = _default_scala_version(),
        maven_servers = ["http://central.maven.org/maven2"]):
    major_version = _extract_major_version(scala_version)

    scala_jar_shas = {
        "2.11": {
            "specs2_core": "55cc27534855370150a88317b37a1ef59150976c56cbd474771e0a2f91f5dd2a",
            "specs2_common": "c34e4408702083cbe063b771dd70b88388660159a7151e611ef5db0cb9c4bcd9",
            "specs2_matcher": "81c9a3043d84f53012c7d1238968f87963964666c10621d7889b67ef049d5f76",
            "specs2_fp": "68f0c6ba88805820fe432b9a353c58004ad151ee1937a88b571863b88256eef1",
            "scalaz_effect": "4d45f0d1bb6958f5c6781a5e94d9528934b6a1404346d224dda25da064b0c964",
            "scalaz_core": "810504bc8d669913af830dd5d9c87f83e0570898f09be6474f0d5603bba8ba79",
        },
        "2.12": {
            "specs2_core": "599a54b0a450d2498c61decd81bdcd1257ba96f392d1fddfb9e2a88f6502ccca",
            "specs2_common": "68a3fe8bce1e9bba17d396322c9eabbdb26691e5bcf633a76f67ea1fcf891881",
            "specs2_matcher": "098ee5e6777b3fb91147b6ca064a6bfbacf37971665f48007c356db1786bc3b8",
            "specs2_fp": "c59872a97b6ebaf8771d4772760be92663050b58043e065457e9e4bfb7cf36e3",
            "scalaz_effect": "eca21ba69a1532c74ea77356b59d6175a5fd54dac7f57f1d1979738c98521919",
            "scalaz_core": "b53cd091daec1c8df8c4244e5b8b460b7416c2cc86aecd25dec4c93d2baf2b04",
        },
    }

    scala_version_jar_shas = scala_jar_shas[major_version]

    _scala_maven_import_external(
        name = "io_bazel_rules_scala_org_specs2_specs2_core",
        artifact = _scala_mvn_artifact(
            "org.specs2:specs2-core:" + specs2_version(),
            major_version,
        ),
        jar_sha256 = scala_version_jar_shas["specs2_core"],
        licenses = ["notice"],
        server_urls = maven_servers,
    )

    _scala_maven_import_external(
        name = "io_bazel_rules_scala_org_specs2_specs2_common",
        artifact = _scala_mvn_artifact(
            "org.specs2:specs2-common:" + specs2_version(),
            major_version,
        ),
        jar_sha256 = scala_version_jar_shas["specs2_common"],
        licenses = ["notice"],
        server_urls = maven_servers,
    )

    _scala_maven_import_external(
        name = "io_bazel_rules_scala_org_specs2_specs2_matcher",
        artifact = _scala_mvn_artifact(
            "org.specs2:specs2-matcher:" + specs2_version(),
            major_version,
        ),
        jar_sha256 = scala_version_jar_shas["specs2_matcher"],
        licenses = ["notice"],
        server_urls = maven_servers,
    )

    _scala_maven_import_external(
        name = "io_bazel_rules_scala_org_specs2_specs2_fp",
        artifact = _scala_mvn_artifact(
            "org.specs2:specs2-fp:" + specs2_version(),
            major_version,
        ),
        jar_sha256 = scala_version_jar_shas["specs2_fp"],
        licenses = ["notice"],
        server_urls = maven_servers,
    )

    _scala_maven_import_external(
        name = "io_bazel_rules_scala_org_scalaz_scalaz_effect",
        artifact = _scala_mvn_artifact(
            "org.scalaz:scalaz-effect:7.2.7",
            major_version,
        ),
        jar_sha256 = scala_version_jar_shas["scalaz_effect"],
        licenses = ["notice"],
        server_urls = maven_servers,
    )

    _scala_maven_import_external(
        name = "io_bazel_rules_scala_org_scalaz_scalaz_core",
        artifact = _scala_mvn_artifact(
            "org.scalaz:scalaz-core:7.2.7",
            major_version,
        ),
        jar_sha256 = scala_version_jar_shas["scalaz_core"],
        licenses = ["notice"],
        server_urls = maven_servers,
    )

    native.bind(
        name = "io_bazel_rules_scala/dependency/specs2/specs2",
        actual = "@io_bazel_rules_scala//specs2:specs2",
    )

def specs2_dependencies():
    return ["//external:io_bazel_rules_scala/dependency/specs2/specs2"]
