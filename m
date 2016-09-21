Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Lx6i8c/xPe36pm8sCiNDTJJeMMNdOtltFE5XYdqix/g=;
 b=0JqmqDTnQmQKM9UbPWu/eyzyiNh/HUyw3xghS2ff06UfUAnd/yUw91py3a1dHaSqii
 VGsM7Mhsg+ZXz1V/TVRgH9vpJr1BBj5fyKFuLHW0sw9PLv192la6rJ6+xTm5gjfq00sl
 sav41vIYJgGZo1H6HTM6Rw56xUenCw7iFJk8vZ52GtppKoJBo7vXAU6l8prMJeNkQWYF
 WT3q0vIiHwq9AgGPrYrebYYkpKQvqHq7KV0JP64YNVkLeh9y6AL72NjmZwskfNba/LkB
 5c4z5gIJ4Lzo9wV/MUX5tTlJ0980upyegzgxezeD2qo1QeFYs5oKZFbxSwYS2irT3QiT
 8U0A==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH v2] formal/dyntickrcu: Fix typos
Date: Wed, 21 Sep 2016 22:01:57 +0900
Message-Id: <20160921130157.9244-1-sj38.park@gmail.com>
In-Reply-To: 
 <CAEjAshq0mtEeqefxyS5mvgbJB5iW9sD6Z2cNTc7X3W7jfT2nRg@mail.gmail.com>
References: 
 <CAEjAshq0mtEeqefxyS5mvgbJB5iW9sD6Z2cNTc7X3W7jfT2nRg@mail.gmail.com>
To: akiyks@gmail.com, paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Suggested-by: Akira Yokosawa <akiyks@gmail.com>
Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 formal/dyntickrcu.tex | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/formal/dyntickrcu.tex b/formal/dyntickrcu.tex
index 5ede587..bbbdb18 100644
--- a/formal/dyntickrcu.tex
+++ b/formal/dyntickrcu.tex
@@ -886,10 +886,10 @@ results in failure, as line~23 is checking that the wrong variable
 is even.
 Upon failure, \co{spin} writes out a
 ``trail'' file
-(\path{dyntickRCU-base-sl-busted.spin.trail})
-file, which records the sequence of states that lead to the failure.
+(\path{dyntickRCU-base-sl-busted.spin.trail}),
+which records the sequence of states that lead to the failure.
 Use the {\tt spin -t -p -g -l dyntickRCU-base-sl-busted.spin}
-command to cause \co{spin} to retrace this sequence of state,
+command to cause \co{spin} to retrace this sequence of states,
 printing the statements executed and the values of variables
 (\path{dyntickRCU-base-sl-busted.spin.trail.txt}).
 Note that the line numbers do not match the listing above due to
-- 
2.10.0

