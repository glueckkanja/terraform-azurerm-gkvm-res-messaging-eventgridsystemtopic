# Merged over the gkvm-tools azure profile tflint.example.hcl (hclmerge).

# Examples reference helper modules (Azure/avm-utl-regions, Azure/naming) with
# pessimistic constraints (~> x.y) so they pick up patch releases. Allow ranges
# instead of requiring an exact version.
rule "terraform_module_version" {
  enabled = true
  exact   = false
}
