Return-Path: <SRS0=onBR=PQ=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Dimo5Xj2KaXH9nsT1No5oeIIh2iRQqrjZisJ0E7MTeM=;
        b=nlmGhuBhxXuLwGwLxzHJNKiHWIUFFdWoRR7y0V2+VXTuV805Mysesv39Wqs340x9vU
         KTQ3P0ywhtKqdr6KEr/Kh6yS6xQvkYMElVSVh4z2wjJhmeh3gvjP32z8L78Fnyn5mFaQ
         AxHB9tLAWyrkfjVQxzubwmhuG8WiXo33hK0Vg1sIJ9PXgCq6VP9HTn++RLJlr+kGluSV
         vR7Wz4yvobPQV2G40BncId2YQWPv8HhLcI2COVP+58w9jq2Iue2zNqaZdetzvstCM9nh
         MqtCy2C5m/7z3VQ6jKza8MfMMVDQTm93KXSF0B4ffpkcAihdeKP2mbK/II0YLSWku33t
         Ihuw==
Subject: [PATCH -perfbook 5/5] datastruct: Change marks in Figures 10.20 and
 10.21 to "(x)"
References: <48719e0e-2828-7017-8efe-249dff1ef2a2@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <8e420a24-13d0-953e-2513-911a01f3f08e@gmail.com>
Date: Thu, 28 Oct 2021 09:20:23 +0900
MIME-Version: 1.0
In-Reply-To: <48719e0e-2828-7017-8efe-249dff1ef2a2@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

This change improves consistency with the text.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 datastruct/zipperhashgrow.svg   | 14 +++++++-------
 datastruct/zipperhashshrink.svg | 12 ++++++------
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/datastruct/zipperhashgrow.svg b/datastruct/zipperhashgrow.svg
index 1d35b17a..b0e8e62c 100644
--- a/datastruct/zipperhashgrow.svg
+++ b/datastruct/zipperhashgrow.svg
@@ -165,7 +165,7 @@
          sodipodi:role="line"
          id="tspan2987"
          x="17.100805"
-         y="452.72961">g)</tspan></text>
+         y="452.72961">(g)</tspan></text>
     <g
        id="g3763"
        transform="translate(0,422)">
@@ -339,7 +339,7 @@
          y="78.729584"
          x="17.100805"
          id="tspan5034"
-         sodipodi:role="line">b)</tspan></text>
+         sodipodi:role="line">(b)</tspan></text>
     <g
        id="g5036"
        transform="translate(0,38)"
@@ -403,7 +403,7 @@
          sodipodi:role="line"
          id="tspan5468"
          x="17.100805"
-         y="162.72958">c)</tspan></text>
+         y="162.72958">(c)</tspan></text>
     <text
        sodipodi:linespacing="125%"
        id="text5552"
@@ -414,7 +414,7 @@
          y="248.72958"
          x="17.100805"
          id="tspan5554"
-         sodipodi:role="line">d)</tspan></text>
+         sodipodi:role="line">(d)</tspan></text>
     <text
        xml:space="preserve"
        style="font-size:8px;font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;text-align:center;line-height:125%;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:middle;fill:#000000;fill-opacity:1;stroke:none;font-family:Sans;-inkscape-font-specification:Sans"
@@ -425,7 +425,7 @@
          sodipodi:role="line"
          id="tspan5621"
          x="17.100805"
-         y="328.72958">e)</tspan></text>
+         y="328.72958">(e)</tspan></text>
     <text
        sodipodi:linespacing="125%"
        id="text5681"
@@ -436,7 +436,7 @@
          y="22.410172"
          x="16.510962"
          id="tspan5683"
-         sodipodi:role="line">a)</tspan></text>
+         sodipodi:role="line">(a)</tspan></text>
     <g
        id="g3318"
        transform="translate(-0.72284698,0)">
@@ -1256,7 +1256,7 @@
          y="390.72958"
          x="17.100805"
          id="tspan4442"
-         sodipodi:role="line">f)</tspan></text>
+         sodipodi:role="line">(f)</tspan></text>
     <g
        id="g4444"
        transform="translate(0,360)"
diff --git a/datastruct/zipperhashshrink.svg b/datastruct/zipperhashshrink.svg
index ea77664a..f62b53c8 100644
--- a/datastruct/zipperhashshrink.svg
+++ b/datastruct/zipperhashshrink.svg
@@ -109,7 +109,7 @@
          sodipodi:role="line"
          id="tspan2987"
          x="17.100805"
-         y="30.72958">a)</tspan></text>
+         y="30.72958">(a)</tspan></text>
     <g
        id="g3763">
       <rect
@@ -282,7 +282,7 @@
          y="88.729584"
          x="17.100805"
          id="tspan5034"
-         sodipodi:role="line">b)</tspan></text>
+         sodipodi:role="line">(b)</tspan></text>
     <g
        id="g5036"
        transform="translate(0,58)">
@@ -504,7 +504,7 @@
          sodipodi:role="line"
          id="tspan5468"
          x="17.100805"
-         y="172.72958">c)</tspan></text>
+         y="172.72958">(c)</tspan></text>
     <g
        transform="translate(0,142)"
        id="g5470">
@@ -697,7 +697,7 @@
          y="258.72958"
          x="17.100805"
          id="tspan5554"
-         sodipodi:role="line">d)</tspan></text>
+         sodipodi:role="line">(d)</tspan></text>
     <g
        id="g5556"
        transform="translate(0,228)">
@@ -890,7 +890,7 @@
          sodipodi:role="line"
          id="tspan5621"
          x="17.100805"
-         y="340.72958">e)</tspan></text>
+         y="340.72958">(e)</tspan></text>
     <g
        transform="translate(0,310)"
        id="g5623"
@@ -1074,7 +1074,7 @@
          y="416.51285"
          x="17.100805"
          id="tspan5683"
-         sodipodi:role="line">f)</tspan></text>
+         sodipodi:role="line">(f)</tspan></text>
     <path
        transform="translate(106.08632,395.53399)"
        d="m 134.85536,18.471052 c 0,3.626297 -2.9397,6.565992 -6.56599,6.565992 -3.6263,0 -6.56599,-2.939695 -6.56599,-6.565992 0,-3.626297 2.93969,-6.565991 6.56599,-6.565991 3.62629,0 6.56599,2.939694 6.56599,6.565991 z"
-- 
2.17.1


