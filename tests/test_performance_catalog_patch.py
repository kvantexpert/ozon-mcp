from pathlib import Path
import yaml

ROOT = Path(__file__).resolve().parents[1]
CATALOG = ROOT / "patches" / "marketplaces-mcp-ru" / "perf_endpoints.yaml"

def load():
    data = yaml.safe_load(CATALOG.read_text(encoding="utf-8"))
    return data["endpoints"]

def test_catalog_has_48_operations():
    eps = load()
    assert len(eps) == 48
    assert len({e["operation_id"] for e in eps}) == 48

def test_required_new_operations_exist():
    eps = {e["operation_id"]: e for e in load()}
    expected = {
        "ozonperf_post_api_client_statistics_products_sku": ("POST", "/api/client/statistics/products/sku", "read"),
        "ozonperf_patch_api_client_campaign_campaignid": ("PATCH", "/api/client/campaign/{campaignId}", "write"),
        "ozonperf_get_api_client_campaign_all_sku_promo_set_bid": ("GET", "/api/client/campaign/all_sku_promo/set_bid", "write"),
    }
    for oid, expected_tuple in expected.items():
        assert (eps[oid]["method"], eps[oid]["path"], eps[oid]["safety"]) == expected_tuple

def test_performance_safety_corrections():
    eps = {e["operation_id"]: e for e in load()}
    assert eps["ozonperf_post_api_client_min_sku"]["safety"] == "read"
    assert eps["ozonperf_post_api_client_search_promo_bids_recommendation"]["safety"] == "read"
    assert eps["ozonperf_get_api_client_campaign_all_sku_promo_activate"]["safety"] == "write"
    assert eps["ozonperf_get_api_client_campaign_all_sku_promo_deactivate"]["safety"] == "write"
    assert eps["ozonperf_get_api_client_campaign_all_sku_promo_set_bid"]["safety"] == "write"

def test_no_performance_get_mutator_is_read():
    mutators = {
        "/api/client/campaign/all_sku_promo/activate",
        "/api/client/campaign/all_sku_promo/deactivate",
        "/api/client/campaign/all_sku_promo/set_bid",
    }
    assert [e for e in load() if e["path"] in mutators and e["safety"] == "read"] == []
