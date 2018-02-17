
import app
import json
import pytest

test_params = {"registry_type": "MintableRegistry", "name": "Some Name", "symbol": "TEST", "desc": "long ass description string", "num_tokens": 1, "url": "url"}

@pytest.fixture
def client(request):
    test_client = app.app.test_client()

    def teardown():
        pass # databases and resourses have to be freed at the end. But so far we don't have anything

    request.addfinalizer(teardown)
    return test_client

def test_generate(client):
    return client.post('/', data=test_params, content_type='application/json')
