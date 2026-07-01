# Unit Tests — tf-atom-elasticache-parameter-group-aws
#
# These tests use a mock AWS provider — no real AWS calls are made.
# Run with:         terraform test -test-directory=tests/unit
# Run verbose:      terraform test -test-directory=tests/unit -verbose
#
# Assertions target plan-KNOWN values only (the tf-label `id`, input
# pass-throughs, resource count). Computed attributes such as the resource
# `id`/`name` are unknown under a mock provider and are not asserted on.

mock_provider "aws" {}

variables {
  namespace = "eg"
  stage     = "test"
  name      = "thing"

  family = "redis7"
  parameters = [
    {
      name  = "maxmemory-policy"
      value = "allkeys-lru"
    }
  ]
}

# ---------------------------------------------------------------------------
# Test: resource is created when the module is enabled (default)
# ---------------------------------------------------------------------------
run "creates_when_enabled" {
  command = plan

  assert {
    condition     = length(aws_elasticache_parameter_group.this) == 1
    error_message = "Expected exactly one parameter group when enabled"
  }

  assert {
    condition     = aws_elasticache_parameter_group.this[0].name == "eg-test-thing"
    error_message = "Parameter group name should equal the tf-label id 'eg-test-thing'"
  }

  assert {
    condition     = aws_elasticache_parameter_group.this[0].family == "redis7"
    error_message = "Parameter group family should be passed through from var.family"
  }

  assert {
    condition     = length(aws_elasticache_parameter_group.this[0].parameter) == 1
    error_message = "Expected the single configured parameter to be present"
  }
}

# ---------------------------------------------------------------------------
# Test: no resources are created when the module is disabled
# ---------------------------------------------------------------------------
run "disabled_creates_nothing" {
  command = plan

  variables {
    enabled = false
  }

  assert {
    condition     = length(aws_elasticache_parameter_group.this) == 0
    error_message = "Expected no parameter group to be created when enabled = false"
  }

  assert {
    condition     = output.id == null
    error_message = "id output should be null when the module is disabled"
  }

  assert {
    condition     = output.name == null
    error_message = "name output should be null when the module is disabled"
  }
}
