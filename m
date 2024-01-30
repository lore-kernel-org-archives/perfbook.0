Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 031C167728
	for <perfbook@vger.kernel.org>; Tue, 30 Jan 2024 15:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706629043; cv=none; b=WOatFzV9K4yu1BZbAVe0zW17Fxqd2VRvGfNxcE/EBhh4xY4xkH/kElJR11LRRbD0y16ZZYtvl6DesWQgdbvP+CcR7HCNuxZX/+dVp/B72yLqJVii7+BcU9qcBm6UwCpfz+qxHSdW2VgpZ/ntgM/Q82Ue0V/ecXCRkpqCSX06N78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706629043; c=relaxed/simple;
	bh=cmeDf7PYBGPhq61/Y5ABvQzYAuhMmaDU1YLaI1LEDow=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=vA0rH0R2okaUlbu7Zm9J6IvvMDXDkakweD9fpVOoAe3siDvYu6V7H3jA/tm20574XnFq5u74p2D7Kpu1dvP4LBNYnbnMLHSQxqZou87Rov/9G16IXQ4RNOQGgE1CQ5j5sSMTvk9GC94n5pP3Bkkf3cp5cRkJewQ+/BdoQpBNYp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bEgfm/YL; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bEgfm/YL"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-6ddf26eba3cso2553113a34.0
        for <perfbook@vger.kernel.org>; Tue, 30 Jan 2024 07:37:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706629041; x=1707233841; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hvO2wiMf/fJTW1+MmyfpV3m8wAIT1U5BiwJRBHqjRzE=;
        b=bEgfm/YLWupbv+Q/laLvKxBWpisba74p/0Scv9dpIM2I5lySU22Mt8yPLWRGnr+DZx
         q6HnCkQ7fq3uYiGiv8m0IApB1YHvF13He/lsvy1Y4QzJ10FQJ5QADniB6vftfSA/MxaR
         hLdLp2UWi9yX1bAHN3nGqP9JXInDDW7tFBeEH67unJsNNjSIFZ+6SHzt4eGvlFamzunS
         Jy2SpQ/Hx+yqhema3mjKJyskcT9jlOtSXlJ6SXGNReJbWIiFeRF9ZBgtN9jiNMmfS2bG
         EFR++yO/9SAryNWKa6Wa5Z6XtyoKHP7odrIUkSXbJ2HJOyuMleEhTYNH6Lkue02L1rJj
         rwyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706629041; x=1707233841;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hvO2wiMf/fJTW1+MmyfpV3m8wAIT1U5BiwJRBHqjRzE=;
        b=p42/slPXm5ahnuxmzV8act3jALt3K4pL5v16hE/fOmpwYwX8TbeHmgMn7S/SRlyda2
         jkvUWrKCML1ytLLz7OPdUN1DKskdTzJPELQcDJWkDNu3LLNSTrzLmxHPUo046scsxx1O
         CcKcI7+k7Jc5Pb4lwZHfSepS/VjWA+IKRDmh1fLUhkVcpoaYrETDn+tgU/fxjlcjVEZG
         TJHuJ7gsdCVL8RYIgxRKAAgK90eSltooGHCBMciLyEdUGQLpeAFaHGKJLD5m9X01vUoj
         fqkxNhrQ+8ntT822pNPf9Zl2zF2RFQXIyKuxlyhphEst79aogClNuHN6l03HKxrfX9y6
         uzqg==
X-Gm-Message-State: AOJu0YyjBw1uZ3Amz1YGlF43auGvtBZxf6NU/ar6VJXFSANUvTudVQis
	Tpst927rS7qs6E9KEMrha6+EU5vpa7gM04eBFtWAtNCPYEUyVfXM
X-Google-Smtp-Source: AGHT+IFTQMyZUKeiNCmZ9xTNVMhHu03hj99z/LoasRfYiLc0TxNq4K4CLysrxLNFbT1NNGLHW9wdMA==
X-Received: by 2002:a05:6358:ed0a:b0:178:951b:d1a6 with SMTP id hy10-20020a056358ed0a00b00178951bd1a6mr1268196rwb.25.1706629040953;
        Tue, 30 Jan 2024 07:37:20 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVM8yzNkt50pZ/hO+3oAf8ue3CTCi+brnux5/U2Y0Ve+8TKWGPj6zAz0BUPymrL+WTBgwEo8u5UcIPHJvhDHW8F
Received: from [10.0.2.15] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id s22-20020a635256000000b005ca0ae17983sm8339245pgl.8.2024.01.30.07.37.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jan 2024 07:37:20 -0800 (PST)
Message-ID: <e8dbc1ec-3980-450e-91aa-5814bdc5f0c0@gmail.com>
Date: Wed, 31 Jan 2024 00:37:18 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [RFT PATCH -perfbook 2/2] CodeSamples/cpu/data: Use "smooth
 frequency" for plotting histogram
Content-Language: en-US
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <903d71c1-b92c-49a9-8365-a931fcaf2514@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <903d71c1-b92c-49a9-8365-a931fcaf2514@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Add gnuplot scripts for generating EPS plots.

Use "smooth frequency" feature of gnuplot for plotting distribution
histograms.

Distribution data in coe.dat, fre.dat, and rfe.dat are converted
on-the-fly into single-column data by using expand.pl as a filter.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 .../expand.pl                                 | 42 ++++++++++
 .../plots.sh                                  | 83 +++++++++++++++++++
 2 files changed, 125 insertions(+)
 create mode 100755 CodeSamples/cpu/data/kerneltest009.05.atn6.2024.01.17-08.25.02/expand.pl

diff --git a/CodeSamples/cpu/data/kerneltest009.05.atn6.2024.01.17-08.25.02/expand.pl b/CodeSamples/cpu/data/kerneltest009.05.atn6.2024.01.17-08.25.02/expand.pl
new file mode 100755
index 00000000..30719692
--- /dev/null
+++ b/CodeSamples/cpu/data/kerneltest009.05.atn6.2024.01.17-08.25.02/expand.pl
@@ -0,0 +1,42 @@
+#!/usr/bin/env perl
+# SPDX-License-Identifier: GPL-2.0-or-later
+#
+# Expand frequency data of the form:
+#
+#   1000 4
+#   1004 2
+#   1050 1
+#
+# into:
+#
+#   1000
+#   1000
+#   1000
+#   1000
+#   1004
+#   1004
+#   1050
+#
+# Copyright (C) Akira Yokosawa, 2024
+#
+# Authors: Akira Yokosawa <akiyks@gmail.com>
+
+use strict;
+use warnings;
+
+my $line;
+my $freq;
+my $count;
+
+open(my $fn, '<:encoding(UTF-8)', $ARGV[0])
+    or die "Could not open file '$ARGV[0]' $!";
+
+while($line = <$fn>) {
+    if ($line =~ /(\-?[0-9]+)\s+([0-9]+)/ ) {
+	$freq = $1;
+	$count = $2;
+	for (my $i = 0; $i < $count; $i++) {
+	    print "$freq\n";
+	}
+    }
+}
diff --git a/CodeSamples/cpu/data/kerneltest009.05.atn6.2024.01.17-08.25.02/plots.sh b/CodeSamples/cpu/data/kerneltest009.05.atn6.2024.01.17-08.25.02/plots.sh
index 5b589858..ca083bca 100644
--- a/CodeSamples/cpu/data/kerneltest009.05.atn6.2024.01.17-08.25.02/plots.sh
+++ b/CodeSamples/cpu/data/kerneltest009.05.atn6.2024.01.17-08.25.02/plots.sh
@@ -67,3 +67,86 @@ set nokey
 # set label 5 "refcnt" at 0.15,2.8 left
 plot "rfe.dat" w points pt 6 pointsize 0.5
 ---EOF---
+
+# For eps output
+font=../../../../fonts/uhvr8a.pfb
+fontsize=8
+przsize="nosquare 0.55,0.25"
+
+gnuplot << ---EOF---
+set term postscript portrait color ${fontsize} enhanced fontfile "${font}" "NimbusSanL-Regu" 
+set size $przsize
+set output "coe-nvals.eps"
+
+set xlabel "Time (Timestamp Periods)"
+set ylabel "Number of Simultaneous Values"
+#set logscale y
+set xrange [:10000]
+#set yrange [100:10000]
+set nokey
+plot "coe-nvals.dat" w l
+---EOF---
+
+gnuplot << ---EOF---
+set term postscript portrait color ${fontsize} enhanced fontfile "${font}" "NimbusSanL-Regu"
+set size $przsize
+set output "coe.eps"
+stats "< perl expand.pl coe.dat" nooutput
+N = STATS_records
+
+set xlabel "Store-to-Store Latency (Timestamp Periods)"
+set ylabel "Frequency (arb. unit)"
+#set logscale y
+set xrange [-1000:3000]
+set yrange [0:]
+set nokey
+#set border 3
+set yzeroaxis
+set boxwidth 40
+#set style fill solid 1.0 noborder
+bin_width = 40
+bin(x) = bin_width * floor(x/bin_width)
+plot "< perl expand.pl coe.dat" using (bin(column(1))):(20./N) smooth frequency with boxes
+---EOF---
+
+gnuplot << ---EOF---
+set term postscript portrait color ${fontsize} enhanced fontfile "${font}" "NimbusSanL-Regu"
+set size $przsize
+set output "fre.eps"
+stats "< perl expand.pl fre.dat" nooutput
+N = STATS_records
+
+set xlabel "Load-to-Store Latency (Timestamp Periods)"
+set ylabel "Frequency (arb. unit)"
+#set logscale y
+set xrange [-250:50]
+set yrange [0:]
+set nokey
+set yzeroaxis
+set boxwidth 2
+#set style fill solid 1.0 noborder
+bin_width = 2
+bin(x) = bin_width * floor(x/bin_width)
+plot "< perl expand.pl fre.dat" using (bin(column(1))):(20./N) smooth frequency with boxes
+---EOF---
+
+gnuplot << ---EOF---
+set term postscript portrait color ${fontsize} enhanced fontfile "${font}" "NimbusSanL-Regu"
+set size $przsize
+set output "rfe.eps"
+stats "< perl expand.pl rfe.dat" nooutput
+N = STATS_records
+
+set xlabel "Store-to-Load Latency (Timestamp Periods)"
+set ylabel "Frequency (arb. unit)"
+#set logscale y
+set xrange [0:350]
+set yrange [0:]
+set nokey
+set yzeroaxis
+set boxwidth 2
+#set style fill solid 1.0 noborder
+bin_width = 2
+bin(x) = bin_width * floor(x/bin_width)
+plot "< perl expand.pl rfe.dat" using (bin(column(1))):(20./N) smooth frequency with boxes
+---EOF---
-- 
2.34.1


