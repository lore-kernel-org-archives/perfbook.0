Return-Path: <SRS0=Srvm=GU=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=EWRT8ZRZLOsoJktTWJ+l1dNH04sb7Jvk1elpbnpxYww=;
        b=g+6iWkTnXcN7nLgqnkWVz97DR/ujInAXX22C2wVLEjQhEoZxD+5r3jfPm3YzOi0QNx
         A34AKLKSIEnJyOH0RhAnNym25+1usf9L9xWttm2VgFDAsBcTozb1jH5bcyX0HLOqZPO5
         gHTUTnQ30k+JCGuUQNG+mNFe4Tpdgnagosm/8P6B0ljk4folbmXoaVnUwNKF23B49h55
         p3d2jhdCe03nqcH9LaCCXGPN678oTN7I3Z3Q7+Nat4UssfvHFVVyHICA1BF2+msLlP2s
         T3UA3SKDvSeMseM44TIeq5sIuxYyYy7+Gd9BaGjUV6M3f+jnL8yP0wv2VPvNRT1HJdbF
         mQOg==
Subject: [PATCH 2/3] rcutorture.sh: Add "rcuscale" to test code
References: <25e9a0f4-8903-1523-9d04-ce34d7d97db6@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <e8f6ba01-9a4a-98ee-817f-69a43d06edcb@gmail.com>
Date: Mon, 18 Jan 2021 00:06:37 +0900
MIME-Version: 1.0
In-Reply-To: <25e9a0f4-8903-1523-9d04-ce34d7d97db6@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Linux v5.10 saw the rename of "rcuperf" to "rcuscale".
"rcuscale" related code should be accounted as test code.

Also update the output format to be compatible as gnuplot input.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/formal/rcutorture.sh | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/CodeSamples/formal/rcutorture.sh b/CodeSamples/formal/rcutorture.sh
index 296a804b..0782b390 100644
--- a/CodeSamples/formal/rcutorture.sh
+++ b/CodeSamples/formal/rcutorture.sh
@@ -25,9 +25,9 @@ tags="`git tag -l | grep '^v' | grep -v -e - | grep -v '\..*\..*\.' | grep -v '2
 for t in $tags
 do
 	git reset --hard $t > /dev/null 2>&1
-	nontorture="`ls kernel/*rcu*.* kernel/rcu/* include/linux/*rcu* 2> /dev/null | grep -v torture | grep -v rcuperf | grep -v refperf`"
+	nontorture="`ls kernel/*rcu*.* kernel/rcu/* include/linux/*rcu* 2> /dev/null | grep -v torture | grep -v rcuperf | grep -v refperf | grep -v rcuscale`"
 	ntn="`wc -l $nontorture 2> /dev/null | tail -1 | awk '{ print $1 }'`"
-	tn="`wc -l tools/testing/selftests/rcutorture/configs/*/*.sh kernel/rcutorture.c kernel/rcu/torture.c kernel/rcu/rcutorture.c kernel/rcu/rcuperf.c kernel/rcu/refperf.c kernel/torture.c tools/testing/selftests/rcutorture/bin/* 2> /dev/null | tail -1 | awk '{ print $1 }'`"
+	tn="`wc -l tools/testing/selftests/rcutorture/configs/*/*.sh kernel/rcutorture.c kernel/rcu/torture.c kernel/rcu/rcutorture.c kernel/rcu/rcuperf.c kernel/rcu/refperf.c kernel/rcu/rcuscale.c kernel/torture.c tools/testing/selftests/rcutorture/bin/* 2> /dev/null | tail -1 | awk '{ print $1 }'`"
 	frac="`awk -v ntn=$ntn -v tn=$tn 'END { printf "%.1f", 100 * tn / (tn + ntn) "%"; }' < /dev/null`"
-	echo $t '&' $ntn '&' $tn '&' $((ntn + tn)) '&' $frac '\\\\'
+	echo $t  $ntn $tn $((ntn + tn)) $frac
 done
-- 
2.17.1


