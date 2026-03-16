Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F8ED221540
	for <perfbook@vger.kernel.org>; Mon, 16 Mar 2026 09:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773652560; cv=none; b=Owf//Ad0ny7t+OY5IHIxjrEbnSTzD0HpYWzeEipJvt+MEzMmqSK7hUBf61BMU2v6VYC/TTDDZCuy0U+USWsZzbLHZU1X8ZmDAwwZDjmVON7K7Z442VyMyCYl/pgQX8SDklEzJ+PX6ELncgPmKw5IRdGJVDY7XIyG37SlJl3jHzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773652560; c=relaxed/simple;
	bh=aFUg4eZWS3twQfwCriBVgpCWHq8msXbxvaItri/CH6s=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=nN3zHsBmdLV5Ot96jDoLE9KOFqKjvO8KMz55gSDOXU5X6BzW6IS5GvO90xWO6qnZvL48DcNCGah0Egq6tD6FvO6gO7zC+MJzn0GdTKvk6g6vBj3q6+apfQ9CFtWcYphmDNB93vELf5gLB/gYTe1S83wXPh3ISfg1O5vn1eU38og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=STWyUArf; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="STWyUArf"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-359f35dfef6so2239187a91.2
        for <perfbook@vger.kernel.org>; Mon, 16 Mar 2026 02:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773652559; x=1774257359; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NeKLSyGBuZ3loU81TPlyzTU6EZUBhgy2yZ/OIN4eFfM=;
        b=STWyUArf38YuCGdgCwGsYcGDtLVWD77kHfypxwPgH5g6TTPOMU9JVuQhAirGYF7y+H
         ATvZPsEWBznrNcBKMyP2rzm5tfq+Bghl76tHuvFUyGPSVbJw+2k3XMObiPpCPu2200G/
         DcPKxgRJqRKzJCAWLSf2fLGrWVBMNjDOc1CLZE9DJ41Tqqu9uda/4huAoezQzXUb7k/+
         0jJ42STQzHXHsVn8H2UzrNzCIS2iZJOK1TJZY4dEnH/auxwTM6t90NT46p4LyH0wsj7C
         9/M2Tnqq3aILSFR2mxINJC/MOtwArvpKnCaooYznxJFyoFpO4HAcOIrYUvkFZDjE3Ppx
         Gf/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773652559; x=1774257359;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NeKLSyGBuZ3loU81TPlyzTU6EZUBhgy2yZ/OIN4eFfM=;
        b=QapD+hEYGyC23bZ7vY6h0E0v1slZSe4lNZjDecZtsI5QC8q8+2WjeNgea1+/7Cj1hK
         yIubcY29AWKKCWSiZeR63j5WP1sa/t2SplcUR3d4nSRyTlzet4K+IDURmDRNBq+EBnso
         TCXPhxvR2+mXG8bwcN/EDNSVqW28ylFcL4UoceBPgvkjKAoOOu6aBHqX6Rer2ot2hPZo
         D+iUiuhVxXxw8reVVQCbAMdWRmJmdaM/sNIecq+SlB/mvuRZgb4v32C6SVWTzwDzA3K8
         I7hSFOMTJ4BvWxs3xt/p+F/aqFZ1ktXQrHkn4oYTiCnsVt4QtBPZuPC74pB+H9pUmKFx
         fx6g==
X-Gm-Message-State: AOJu0YyUOdDJ+kyqTpQ0QXeGhVnMhXJQyTeSTC/0OOUdAzbvt/NbeAFK
	i9ROBbfLsqi0h7sNnI3tzfYk0Ldn0YLAjzY4bMVl0MmLO3tyGiLreh4OY5GbUA==
X-Gm-Gg: ATEYQzwUAsN+6z1yVN/uBTK/WFmUff3O+xnLe4D+F87wSGGxvS4Z7qyFXmv99QnS6qk
	QK9JiRO/VlyP4Pnjxn2k2HsoHAoVkM6XGumUgwa1//QulTUlmsTxjNBGHSdpc2wylJdBek9OLtJ
	H5rH90EF3osYQBwvZwedEXSHeTD61FyqFHfHXhsqK6iJeUjdJBco6/PblwkYTzKS+q7REyVP5GV
	11YnewNfq+ntoXBjnvVYCzPm8ppnHLd4x0jwrf31aVOByuVbg8l17yNxKqzwm/ISjWp11b+VIHK
	c2eIB3lC23J6aTKM7SkllWkmx3rZGyrlhTz6wKeWCIHac/rUIXvBYlpQKQZhsdz11+OCa4nDUE0
	RLLwfA6EDJuu9w0VEmM6/ZCKIsmycWMd/kklfLUjTuF36I6p1rdIc+tZqEUyfOaO5kzCeZ5WzF7
	WN5W1j4jp2/9o51cXrClkxlU3/JeNzu/6LR288XI9CIiNOfJIWMCcodiWrBi7HBNcw2BMwlxUCe
	JjuBQ0=
X-Received: by 2002:a17:90b:3812:b0:35b:a960:62bb with SMTP id 98e67ed59e1d1-35ba960651fmr346001a91.15.1773652558679;
        Mon, 16 Mar 2026 02:15:58 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7400000532sm3647959a12.27.2026.03.16.02.15.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 02:15:58 -0700 (PDT)
Message-ID: <7e535d83-2f19-4423-9a7d-297fb4b4d8fc@gmail.com>
Date: Mon, 16 Mar 2026 18:15:56 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook] Extend buggy fvextra version range
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Unfortunately, the tentative fix to the regression of fvextra has
failed to convince the maintainer [1] and fvextra v1.14.0 was
released with the regression unresolved [2].

Extend the buggy range of fvextra.

Link: https://github.com/gpoore/fvextra/issues/32#issuecomment-3942491507 [1]
Link: https://github.com/gpoore/fvextra/releases/tag/v1.14.0 [2]
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
Looks like Archlinux's texlive-latexextra (2026.0-3) comes with
fvextra.sty v1.14.0.

--
 utilities/autodate.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utilities/autodate.sh b/utilities/autodate.sh
index 839db7f3..c72194fa 100644
--- a/utilities/autodate.sh
+++ b/utilities/autodate.sh
@@ -136,7 +136,7 @@ fi
 
 # check if fvextra is buggy ("samepage=true")
 FVEXTRA_BUGGY_SINCE=v1.11.0
-FVEXTRA_BUGGY_UNTIL=v1.13.2
+FVEXTRA_BUGGY_UNTIL=v1.14.0 # as of 2026/02/25
 
 fvextra_sty=`kpsewhich fvextra.sty`
 if [ "x$fvextra_sty" != "x" ] ; then

base-commit: 492e8f9483d3e1dfd3768ef43dd462dd78e40c3b
-- 
2.43.0

