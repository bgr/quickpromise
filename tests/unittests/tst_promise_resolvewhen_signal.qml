import QtQuick 2.4
import QtTest 1.1
import QuickPromise 1.0

TestCase {
    name : "Promise_ResolveWhen_Signal"

    Timer {
        id: timer;
        repeat: true
        interval : 50
    }

    Promise {
        id : promise
        resolveWhen: timer.onTriggered
    }

    function test_resolvewhen_signal() {
        compare(promise.isFulfilled,false);
        wait(10);
        compare(promise.isFulfilled,false);
        timer.start();
        wait(10);
        compare(promise.isFulfilled,false);
        wait(50);
        compare(promise.isFulfilled,true);

    }
}

