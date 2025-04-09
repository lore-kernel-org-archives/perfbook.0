Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B51268FED
	for <perfbook@vger.kernel.org>; Wed,  9 Apr 2025 15:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744211019; cv=none; b=db/TuCqOgxE8kyRmyLYv0sEIx6JvGB1e1txc8OQjIOiEAwNtKfer3YchEZoDwnB7MPHwULCAR55VZtNroA0w2EIWj2Fp58pRuNwFa5HtIrTMtpaD3dPL6xsdhobOnJ+rgxOLoaA+U1EBVRXiSPMXXg1cstlL3eKKlEWDRjuQGl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744211019; c=relaxed/simple;
	bh=SgROrKA5nxmlpxX9LhxVCRjbsC6J79AS/tjgL59mAHM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZE+eBdc4PkYbC0t4rVyED28KaWynDBTo/ROgX7wJjZYmvAYJpy/bulwiA1LdwLd8KqU+85j33jPSbDx3nON5Um09UcVm+JL0EE8jAgpLTjLu6v4qQz1gVnRVLlIvkemiCu3XTme9KTH3Tp9bc3sMlEu8oAF+868YnvaHWer4Ago=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MRdbRV89; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MRdbRV89"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7399838db7fso978025b3a.0
        for <perfbook@vger.kernel.org>; Wed, 09 Apr 2025 08:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744211017; x=1744815817; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vC+B+AbrIlytohygt/H4KhFR8gLeQK4t6CXFSWGkPFQ=;
        b=MRdbRV89B9evzfwqkur3v5sp1czk96RBP05yjVINE0OmLpPuIQBWUxm4JEbN6D/qzs
         OTV45dXJUxz0wiGsz4fpnQX7IX9pBNrjqfvXAIGjX8QewIWJpy6iG8p5Vpm7R0uaD1jL
         Fs8DNhFcCg3BbaY2wu9VgAO5W6C+wFLdpIv1rMyt22I/9aUI5KqjzvWvN4B4TsREan1z
         9LanHUocND88QOg5R5hv2kuW9HuClfOZc3z7bU1NImwRhqvm7TDZdckPbHeZCizh5WRq
         F5/S0mxrnq0QQ8vESlj95IyQntJopbs173pjO3twNSWEhVD+glKcCHTlG4iNsPEmVLd3
         WgJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744211017; x=1744815817;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vC+B+AbrIlytohygt/H4KhFR8gLeQK4t6CXFSWGkPFQ=;
        b=l9A/vXaqw6qJLjhjQdKqIZu5KKOpruTf3Dk2/chspXdx8FECuPEfJAp6Ec2M3vTq/F
         pwLv/Mn+yvOiQWXWjN0S0AGcxeLkV/uz5IzRfrzNaNiCj5rVYC3np+agXp4psXyWtVzU
         abtdtIVTTqFZaTso9FDsArmm3GOII6BmeemjFaDg4/XRwzwYOfdhWQtXYs4orxtfA3ph
         MFBXxIusdQiocs77dRM9yiaIIstyXrCX6KfhBs+seSpfMuIozvQE5UD8LOz1GtCVBH7h
         ImLs5rrk1EKU+rwkmFGt5mSj9CG5Mzeyf1Bn8LDuf+P5uryezwdT1/IVdTpsJQbX/QSr
         hjgQ==
X-Gm-Message-State: AOJu0YySCoJ1fQjyH2bdsmdaoo9mL5S0GbuBiN41qmb+rm4q3824q3RD
	NbRCXKHnAGGGAkD4nxH+3+iqUc8m+PyT0Xq8cgJZYzSx2z62E2Qa
X-Gm-Gg: ASbGncvxvQZZbdOnOVQeHwk7/awQiYsJP82RN3AGCYj2bdYLPlkefavfbV48PqX7ylB
	bMzZWbYl2z45gfNFLygpTyCsm03DoJzDExy7QnwAnKoUw/0T3Qp5/+qk9TBaEMH/GOAMOHmUkWq
	/Ne2wxaWDr5yhBmcXI+w3PG/h6eBf2r97YZnpijVBQ/e15pA29t8juNfy20384h3xIth+EuhEcm
	Ceh/237zFe//w5skrMx2OAMdXDV0q14wd78cJZu09MEXM5tE3SKsIsQIkJ7gLFy4DV/BuKb5UVu
	Ww3D+aaIQ97AVlmxt/mnLlUfE1w85tqH30EINiDv/pGGiZCBFM1HR9GKRNOkrl/HPaPNeAq6w5P
	u9ZLqYomWYYI=
X-Google-Smtp-Source: AGHT+IFNb0/6MqUV7UKKy5AzBaa4FR6X26144A1sAjfkXD36Ov3tsCXkUq2S3o+33eR198V7EjDVDg==
X-Received: by 2002:a05:6a00:3920:b0:727:39a4:30cc with SMTP id d2e1a72fcca58-73b9d2e3a28mr9774874b3a.1.1744211017149;
        Wed, 09 Apr 2025 08:03:37 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bb1e3813bsm1475275b3a.105.2025.04.09.08.03.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 08:03:36 -0700 (PDT)
Message-ID: <e5a96602-285a-464e-9dfa-63bced02815b@gmail.com>
Date: Thu, 10 Apr 2025 00:03:31 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH perfbook 2/3] glossary: "full(y) multi-copy atomic" is
 synonymous with "multi-copy atomic"
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <e57996f3-2a63-4de8-8a83-c1a6156a1e76@gmail.com>
 <53b7f24f-b0e4-40bf-aa10-dc681816e6d2@paulmck-laptop>
 <c2c49b57-b7e5-4b3e-b06f-d69a5fb1678c@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <c2c49b57-b7e5-4b3e-b06f-d69a5fb1678c@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Add redirection from "Full(y) multi-copy atomic" to "Multi-copy atomic"
in Index as well.  To make this indirection effective in both single and two
level Index pages, move \IfIndexHier{...}{} into indexsee.tex.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 glossary.tex    | 1 +
 indexsee.tex    | 4 ++++
 perfbook-lt.tex | 2 --
 3 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/glossary.tex b/glossary.tex
index 9ded12f8..bc7ebed1 100644
--- a/glossary.tex
+++ b/glossary.tex
@@ -482,6 +482,7 @@
 	Note that this means that if a CPU does a write to a given
 	location followed immediately by a read from that same location,
 	it might take significant time for that read to complete.
+	Sometimes called ``full(y) multi-copy atomic'' for distinction.
 	(See also ``other-multi-copy atomic'' and ``non-multi-copy atomic''.)
 \item[\IXG{Mutual-Exclusion Mechanism}:]
 	A software abstraction that regulates threads' access to
diff --git a/indexsee.tex b/indexsee.tex
index 85527197..4cf02e10 100644
--- a/indexsee.tex
+++ b/indexsee.tex
@@ -1,3 +1,6 @@
+% effecive in both single- and two- level index
+\index{Full(y) multi-copy atomic|see{Multi-copy atomic}}
+\IfIndexHier{ % effective only in two-level index
 \index{Address dependency|see{Dependency, address}}
 \index{Anti-Heisenbug|see{Heisenbug, anti-}}
 \index{Associativity|see{Cache associativity}}
@@ -36,3 +39,4 @@
 \index{Write memory barrier|see{Memory barrier, write}}
 \index{Write miss|see{Cache miss, write}}
 \index{Write-side critical section|see{Critical section, write-side}}
+}{}
diff --git a/perfbook-lt.tex b/perfbook-lt.tex
index fdcb5e8d..e6e5e609 100644
--- a/perfbook-lt.tex
+++ b/perfbook-lt.tex
@@ -729,9 +729,7 @@
 
 % Index if enabled
 \IfIndexOn{
-\IfIndexHier{
 \input{indexsee}
-}{}
 \phantomsection
 \IfEbookSize{
 \idxlayout{columns=2}
-- 
2.34.1


