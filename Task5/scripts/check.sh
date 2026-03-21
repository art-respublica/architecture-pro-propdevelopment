#kubectl exec -n smart-devices deployment/back-end-api -- curl --connect-timeout 2 -s -o /dev/null -w "%{http_code}\n" http://front-end-app
#kubectl exec -n smart-devices deployment/front-end -- curl --connect-timeout 2 -s -o /dev/null -w "%{http_code}\n" http://back-end-api-app
#
#kubectl exec -n smart-devices deployment/admin-back-end-api -- curl --connect-timeout 2 -s -o /dev/null -w "%{http_code}\n" http://admin-front-end-app
#kubectl exec -n smart-devices deployment/admin-front-end -- curl --connect-timeout 2 -s -o /dev/null -w "%{http_code}\n" http://admin-back-end-api-app

#kubectl exec -n smart-devices deployment/admin-back-end-api -- curl --connect-timeout 2 -s -o /dev/null -w "%{http_code}\n" http://front-end-app
#kubectl exec -n smart-devices deployment/back-end-api -- curl --connect-timeout 2 -s -o /dev/null -w "%{http_code}\n" http://admin-front-end-app

NAMESPACE="smart-devices"

echo "🔍 Testing network connectivity..."
echo "================================"

test_connection() {
    local from=$1
    local to=$2
    local expected=$3

    echo -n "Testing $from -> $to: "
    result=$(kubectl exec -n $NAMESPACE deployment/$from -- curl -s -o /dev/null -w "%{http_code}" --connect-timeout 2 http://$to 2>/dev/null || echo "timeout")

    if [ "$result" = "timeout" ] || [ "$result" = "000" ]  || [ "$result" = "000timeout" ]; then
        if [ "$expected" = "allowed" ]; then
            echo "❌ FAILED (timeout)"
        else
            echo "✅ PASSED (blocked as expected)"
        fi
    elif [ "$result" = "200" ] || [ "$result" = "404" ]; then
        if [ "$expected" = "allowed" ]; then
            echo "✅ PASSED (connected)"
        else
            echo "❌ FAILED (should be blocked)"
        fi
    else
        echo "⚠️  Unexpected response: $result"
    fi
}

# Тесты для разрешенных соединений
echo "\n✅ Testing ALLOWED connections:"
test_connection "front-end-deployment" "back-end-api-app" "allowed"
test_connection "back-end-api-deployment" "front-end-app" "allowed"
test_connection "admin-front-end-deployment" "admin-back-end-api-app" "allowed"
test_connection "admin-back-end-api-deployment" "admin-front-end-app" "allowed"

# Тесты для запрещенных соединений
echo "\n❌ Testing BLOCKED connections:"
test_connection "front-end-deployment" "admin-back-end-api-app" "blocked"
test_connection "admin-front-end-deployment" "back-end-api-app" "blocked"
test_connection "front-end-deployment" "admin-front-end-app" "blocked"
test_connection "back-end-api-deployment" "admin-back-end-api-app" "blocked"

echo "\n📝 Note: Some connections might show different HTTP codes (404, 403) but still indicate connectivity"