Return-Path: <SRS0=XXQI=AY=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683157269; x=1685749269;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QziKPDIcne+PbK7avJ5cHkI0g2CyOT3hbuxAs8Vr49I=;
        b=iUKtw0DQgMmxv27+qRy7Yu6BS7m64g4LSVkrjrgQDbh86BmApmXMpAX0f4NrOyPrNb
         GWuNsQfTYZcnRxP5l6EwxxzyCwV9g1lXofek5bXpobe99xTEyB61f20oF0e17Xf5rGih
         9Nc9MQCQtj5OEsWTs7I3FGC1clK+W5OBut0vK21m7gM+pcIIX9//ZMfdazIn1DLcOJop
         DXVXHx3yof4gVfXhWHHylR5deHXBMSlIMdKKK7cxrbNzqxBVIK5PlHJiVT6HKWXgmpD0
         +hprydGz/Jqw7RqOG56M0XweaVwZApLCg2WjsGnAv2s0fgboIET7Nlofs/TiN/usFH3K
         RkUg==
Message-ID: <0d6a6549-6292-d30b-c1a3-19b42f672480@gmail.com>
Date: Thu, 4 May 2023 08:41:03 +0900
MIME-Version: 1.0
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook 1/4] CodeSample/formal/rcutorture.sh: Ignore
 Makefile and Kconfig*
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

kernel/rcu/Makefile was new to Linux v3.13 when RCU related code were
moved under kernel/rcu/.
kernel/rcu/Kconfig was new to Linux v4.13.

Up until v3.12, RCU-related lines in Makefile and Kconfig were not
counted.  So, the extra counts result in a small disjoint of bar height,
especially between v4.11 and v4.13.
(v4.12 was an outlier due to code duplication of old and new SRCU.)

Exclude those files from RCU LOC to be fair.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/formal/rcutorture.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/CodeSamples/formal/rcutorture.sh b/CodeSamples/formal/rcutorture.sh
index bc9a2855b623..236868054e47 100644
--- a/CodeSamples/formal/rcutorture.sh
+++ b/CodeSamples/formal/rcutorture.sh
@@ -25,7 +25,7 @@ tags="`git tag -l | grep '^v' | grep -v -e - | grep -v '\..*\..*\.' | grep -v '2
 for t in $tags
 do
 	git reset --hard $t > /dev/null 2>&1
-	nontorture="`ls kernel/*rcu*.* kernel/rcu/* include/linux/*rcu* 2> /dev/null | grep -v torture | grep -v rcuperf | grep -v refperf | grep -v rcuscale | grep -v refscale`"
+	nontorture="`ls kernel/*rcu*.* kernel/rcu/* include/linux/*rcu* 2> /dev/null | grep -v torture | grep -v rcuperf | grep -v refperf | grep -v rcuscale | grep -v refscale | grep -v Makefile | grep -v Kconfig`"
 	ntn="`wc -l $nontorture 2> /dev/null | tail -1 | awk '{ print $1 }'`"
 	tn="`wc -l tools/testing/selftests/rcutorture/configs/*/*.sh kernel/rcutorture.c kernel/rcu/torture.c kernel/rcu/rcutorture.c kernel/rcu/rcuperf.c kernel/rcu/refperf.c kernel/rcu/rcuscale.c kernel/rcu/refscale.c kernel/torture.c tools/testing/selftests/rcutorture/bin/* 2> /dev/null | tail -1 | awk '{ print $1 }'`"
 	frac="`awk -v ntn=$ntn -v tn=$tn 'END { printf "%.1f", 100 * tn / (tn + ntn) "%"; }' < /dev/null`"

base-commit: f8354eceed493a403160202591c6c383387c4ddc
-- 
2.25.1

