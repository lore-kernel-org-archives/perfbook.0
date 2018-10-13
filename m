Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=3GGJrjL9ydVk0dRTVoMDg7I+Gu+OZdc7Lej8UaZIZAk=;
        b=NjgUPYsEHsfcaBVuLM6aXP2bpmHX+uQQYDbhc099KQt2Pj3kDQHZgdpm8zRYzlj52c
         fIel1jI6UKxanGrBv9jXvWgUiIHqrNfEz8AvvkQeaU43pSAO/cewe9gYBdvgNGcF2aAD
         HtE14yESXrWRkp3z4o9n/ksk3OwTAk76gf8EWJOOpLh81foKWMxdDnxxKRZQYPaKEef8
         IPdmYjYsEPkillW2CRGYdpE9d8GHh6tn8LGQNxRGsVpIUBVWMQPz2uGXmWbbxpKcsh3h
         YMlTe2/oSuEGiJY80Th9QqoTd2P6vsggPjKEXbwffmUIC6uwyzrn0if8dGtMiBUax9FF
         CvGg==
Subject: [PATCH 2/6] count: Fix uses of READ/WRITE_ONCE() in count_lim_app
References: <a20c67f0-db94-7e03-ed69-d09fd51899dd@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <6f3a7c97-fd27-eef1-9196-28c86fffbab5@gmail.com>
Date: Sat, 13 Oct 2018 23:54:49 +0900
MIME-Version: 1.0
In-Reply-To: <a20c67f0-db94-7e03-ed69-d09fd51899dd@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From a3544822ccd81e63b98f3db3c428c1867c983e9a Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Mon, 8 Oct 2018 16:11:29 +0900
Subject: [PATCH 2/6] count: Fix uses of READ/WRITE_ONCE() in count_lim_app

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/count/count_lim_app.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/CodeSamples/count/count_lim_app.c b/CodeSamples/count/count_lim_app.c
index 1817c19..ad8f09f 100644
--- a/CodeSamples/count/count_lim_app.c
+++ b/CodeSamples/count/count_lim_app.c
@@ -59,7 +59,7 @@ static void balance_count(void)
 int add_count(unsigned long delta)
 {
 	if (countermax - counter >= delta) {
-		counter += delta;
+		WRITE_ONCE(counter, counter + delta);
 		return 1;
 	}
 	spin_lock(&gblcnt_mutex);
@@ -77,7 +77,7 @@ int add_count(unsigned long delta)
 int sub_count(unsigned long delta)
 {
 	if (counter >= delta) {
-		counter -= delta;
+		WRITE_ONCE(counter, counter - delta);
 		return 1;
 	}
 	spin_lock(&gblcnt_mutex);
@@ -101,7 +101,7 @@ unsigned long read_count(void)
 	sum = globalcount;
 	for_each_thread(t)
 		if (counterp[t] != NULL)
-			sum += *counterp[t];
+			sum += READ_ONCE(*counterp[t]);
 	spin_unlock(&gblcnt_mutex);
 	return sum;
 }
-- 
2.7.4


