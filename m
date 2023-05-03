Return-Path: <SRS0=XXQI=AY=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683157358; x=1685749358;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yt+MFHYVjjz7tw2xsQ71l1HF2dowF+Nl1CIHjf6Mm28=;
        b=Kez/H9hArJMvbm5FjaikVFYnugFQ8p7ORYNvmWQ8KQR5YqwkiXeloht++uVoeulT9i
         ry09pMomDBMdL47HuMJpfYFA/QOxNFTyKPYkTCshfuW0/WwKB2y/gkD7HTD8AQZtw/wp
         pYm9mTZpkd17rgQNcXYq8d4Jgz+7qAER7l6AWnbwiONpe+8+W9DBptDj/xG1XslLPMlg
         Lkn7eVDxd6M3wYV3htkFO+G+CijLljrVj0quiPGGwZjt8Olc9/4CdJqcQbyFyZ6LtIhT
         n5e/zpCp9VBAZpjmbEfwrIGValX3UX8H+0OHU8Wi96nklZA2uqwgdKV52yUHC/SaVzmg
         EDbg==
Message-ID: <691ce367-dc50-7131-4dd2-9ba31dbf4f4e@gmail.com>
Date: Thu, 4 May 2023 08:42:33 +0900
MIME-Version: 1.0
Subject: [PATCH -perfbook 2/4] Update rcu-test.dat as of v6.3, using updated
 rcutorture.sh
Content-Language: en-US
References: <0d6a6549-6292-d30b-c1a3-19b42f672480@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <0d6a6549-6292-d30b-c1a3-19b42f672480@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Data since v3.13 are affected by the script update.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/formal/data/rcu-test.dat | 103 ++++++++++++++-------------
 1 file changed, 52 insertions(+), 51 deletions(-)

diff --git a/CodeSamples/formal/data/rcu-test.dat b/CodeSamples/formal/data/rcu-test.dat
index 7f8f52b5f56f..49878e8fa034 100644
--- a/CodeSamples/formal/data/rcu-test.dat
+++ b/CodeSamples/formal/data/rcu-test.dat
@@ -39,54 +39,55 @@ v3.8  11584 2174 13758 15.8
 ""    11830 2216 14046 15.8
 ""    10739 2177 12916 16.9
 v3.12 11146 2139 13285 16.1
-""    11358 2145 13503 15.9
-""    11561 3428 14989 22.9
-""    11626 3882 15508 25.0
-v3.16 11841 4074 15915 25.6
-""    12084 4088 16172 25.3
-""    12684 4238 16922 25.0
-""    12809 4230 17039 24.8
-v4.0  12767 4265 17032 25.0
-""    13015 4290 17305 24.8
-""    13027 4348 17375 25.0
-""    13176 4364 17540 24.9
-v4.4  13811 4363 18174 24.0
-""    13978 4421 18399 24.0
-""    14080 4423 18503 23.9
-""    14231 5480 19711 27.8
-v4.8  14307 5549 19856 27.9
-""    14381 5527 19908 27.8
-""    14450 5541 19991 27.7
-""    14649 5559 20208 27.5
-v4.12 17127 5588 22715 24.6
-""    15503 5663 21166 26.8
-""    15400 5712 21112 27.1
-""    15476 5726 21202 27.0
-v4.16 15396 5670 21066 26.9
-""    15393 5703 21096 27.0
-""    15370 5756 21126 27.2
-""    15593 5967 21560 27.7
-""    15138 6054 21192 28.6
-v5.0  15226 8534 23760 35.9
-""    14769 6339 21108 30.0
-""    14733 6075 20808 29.2
-""    14861 6185 21046 29.4
-v5.4  15379 6209 21588 28.8
-""    15448 6211 21659 28.7
-""    15675 6373 22048 28.9
-""    15986 6455 22441 28.8
-v5.8  17424 6627 24051 27.6
-""    17678 7779 25457 30.6
-""    17863 7916 25779 30.7
-""    17978 8033 26011 30.9
-v5.12 18965 9025 27990 32.2
-""    19205 9556 28761 33.2
-""    19362 9983 29345 34.0
-""    19366 10332 29698 34.8
-v5.16 19359 10362 29721 34.9
-""    19576 10482 30058 34.9
-""    19683 10526 30209 34.8
-""    20354 10656 31010 34.4
-v6.0  20422 10716 31138 34.4
-""    20804 10922 31726 34.4
-""    21170 11212 32382 34.6
+""    11352 2145 13497 15.9
+""    11555 3428 14983 22.9
+""    11620 3882 15502 25.0
+v3.16 11835 4074 15909 25.6
+""    12078 4088 16166 25.3
+""    12678 4238 16916 25.1
+""    12803 4230 17033 24.8
+v4.0  12760 4265 17025 25.1
+""    13008 4290 17298 24.8
+""    13020 4348 17368 25.0
+""    13169 4364 17533 24.9
+v4.4  13804 4363 18167 24.0
+""    13971 4421 18392 24.0
+""    14069 4423 18492 23.9
+""    14219 5480 19699 27.8
+v4.8  14295 5549 19844 28.0
+""    14369 5527 19896 27.8
+""    14438 5541 19979 27.7
+""    14637 5559 20196 27.5
+v4.12 17112 5588 22700 24.6
+""    15166 5663 20829 27.2
+""    15063 5712 20775 27.5
+""    15139 5726 20865 27.4
+v4.16 15059 5670 20729 27.4
+""    15056 5703 20759 27.5
+""    15033 5756 20789 27.7
+""    15256 5967 21223 28.1
+""    14801 6054 20855 29.0
+v5.0  14889 8534 23423 36.4
+""    14462 6339 20801 30.5
+""    14424 6075 20499 29.6
+""    14552 6185 20737 29.8
+v5.4  15059 6209 21268 29.2
+""    15128 6211 21339 29.1
+""    15355 6373 21728 29.3
+""    15662 6455 22117 29.2
+v5.8  17054 6627 23681 28.0
+""    17288 7779 25067 31.0
+""    17456 7916 25372 31.2
+""    17567 8033 25600 31.4
+v5.12 18553 9025 27578 32.7
+""    18793 9556 28349 33.7
+""    18950 9983 28933 34.5
+""    18954 10332 29286 35.3
+v5.16 18947 10362 29309 35.4
+""    19182 10482 29664 35.3
+""    19289 10526 29815 35.3
+""    19916 10656 30572 34.9
+v6.0  19954 10716 30670 34.9
+""    20336 10922 31258 34.9
+""    20699 11212 31911 35.1
+v6.3  21087 11457 32544 35.2
-- 
2.25.1


