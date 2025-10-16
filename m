Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E9F32860A
	for <perfbook@vger.kernel.org>; Thu, 16 Oct 2025 15:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760627772; cv=none; b=Zr8sUmnMaQtMzsXjLVKNp+yfOfAMlyDZVNiO4nZ9V3vE5I/6OVEkp8yTr6DP2LHRlKIB5JREElIGX07gVK1gpmR1rA1FRpCGaPDBuTJnDB+a9Sn3o4poD7kFqSrA4v6rf7WaZzMlWgGGoL+BDG+T//2Aoa7xzaRnOYx2LgmvngI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760627772; c=relaxed/simple;
	bh=e5ynhPunD5frc9G9RHZl7GeFnSvRGIWorPdwSxsMyuo=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=IhA38IgfrO4XS0swubg5M2Ms699Mm2QfLsrABhk48L1DoW0K805jogNEWJ3k2j7/grwhdSyXUvVcW8nghPQyDmuWX2LklPkx3e5ksubjNRqX7XF6TSD8ZRsFJg9/+aDTV0rxmwR5WOZCGs8gE4q8yF32hpFliIIKu2uZKtXVqds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VOeAo39J; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VOeAo39J"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7a213c3c3f5so1213038b3a.3
        for <perfbook@vger.kernel.org>; Thu, 16 Oct 2025 08:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760627771; x=1761232571; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K03m27xc9XT4z2seHWglOhnPCBfNPhyW8X1JrVzamXA=;
        b=VOeAo39JBxUBtws0Jl874qoW0bJrkg2rlJ3X2vbeq+oJlo2Fbn5jxCuMaV1/a2Mvsn
         vt0Hl8hFuiF/+s/tYSGxOELGY8yu8zL9CXhnGgE8DTSMWJ+D3uKtuDWcW8wBUrU5pAfR
         lNvXfOCtZAV1BwO+nYivCW9oHZoqjydagG+UDU2e/2SUP0Z2FflKRBhnYchPVW0WdA45
         hMHfR38tS9F3l/aEvb+C7qS9InC2d7EbWPQr2hkpR9pIb5XVreeCfxBtPSmjmkDT1OzL
         El/JddNi5ktcbLOEOE2BWBA1NWyAaHoKQilH7rOArVxKBq3WJs6WCLkFEV1nQ237GZqc
         I02Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760627771; x=1761232571;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=K03m27xc9XT4z2seHWglOhnPCBfNPhyW8X1JrVzamXA=;
        b=n4ZcWR5cEA4LmmRmzvV3reejRugi+oOQKrZlOk1umy+4j1YM4Gu6Ko/f+yqmHBTccj
         T8Vb12iQ1dIY59Oh7i7ZfRC4agbnJhpfwJLiROpEvzpsJkpFOLAiILpptVFDw/L4/XWx
         CNPdunYj/V5+AIl5z9j2cWo5Fi3DK8tRLn8v7iLuzEkiie2rEk8Hdg+S/QbMV6R8BxVx
         BdcfXaaZl68t3cLh+JG+rhauuWyF0XItEuVWDcGWnzyrM74PgAFl/A/7gyN/ZmKIgw8k
         Vbq551mYZ3lcvVwFbvSOP+uK7kjTA1zWnbcBLF5f7dTiumLwoNpLuh1cjMVAZccfDvKP
         xcvw==
X-Gm-Message-State: AOJu0Yw5ZA2rYdJQP/4kFb3EITqjrNYo0sHH9vSx59mXwA4hqPBaGpsU
	udUFVEz22qwgSw1pBoHe14gAIJAl/qPJXPzdg7uKGJ5QiodG8EDuULIn
X-Gm-Gg: ASbGncvHTrKprVVUfA5hH/XJOKfAwicU8x5BYIS/OWXclk06rOK2VJO5+3tBPqZCx7u
	JhS9oXB6BaMkTlDDakiW53al8xntTHdl1EIGrsKspvKfuzdTLH9ODOcZUUzPKAvhpxODDeRCQPv
	OtTAso1gM2FesLl1BegrXd6myiKDQCoOYuiXHgUZpi69gplyCswxVPz8dZtEdkLRBv+oooXxsOZ
	mwVUZACmDqY/ILiel7gXa3BCn2Io0jfN435MTk45vwjQ2E+3PQGS2dY/SddI/kqFJZVoiefmScG
	DOiJVLPVhm0JKPF2ex/7clcvdigT3jeYBKkdDN6ioX9eor5RiZ7LvyFtzyHb5LclHpoPvPA09JU
	3YSLDIAXGmgsx9OcEl6fEaH8KIakVcwCJBOm6C0R0SDx5wiuOoFpkXvRyz3I5K9RgvnEpy1/mt8
	npsaZQOvHzQRmm3sZKgMPbb5hOxIH0XTeZ+hacMxQj6zuMSw==
X-Google-Smtp-Source: AGHT+IH9JAZhQK67haUal3F3tRnxCneRDWfGwEAPfLuCET67FCS32tTaVg3Pzs7K5OdzfXpyuhstOQ==
X-Received: by 2002:a05:6a20:1585:b0:334:7ab1:5203 with SMTP id adf61e73a8af0-334a85a5480mr514886637.28.1760627770544;
        Thu, 16 Oct 2025 08:16:10 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33bb6625662sm2286545a91.6.2025.10.16.08.16.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Oct 2025 08:16:10 -0700 (PDT)
Message-ID: <1193cace-2484-4c4c-b14c-a40a51550117@gmail.com>
Date: Fri, 17 Oct 2025 00:16:12 +0900
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
Subject: [PATCH -perfbook] runlatex.sh: Detect fvextra versions with known
 minor regression
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

fvextra versions from v1.11.0 to v1.13.2 (latest) have a minor regression
which ignores fancyvrb's "samepage=true" key.  It is used in perfbook to
prevent short snippets from broken across columns/pages.  This is a minor
regression but affects reproducible build of perfbook.

Add commands at the final phase of runlatex.sh to detect those buggy
fvextra and emit suggestion of installing unaffected fvextra.

Unfortunately, distro texlive packages based on upstream TeX Live since
early March 2025 are all affected by this regression, including debian
trixie and opensuse/leap 16.0 (Long Term Support); and ubuntu plucky
and questing (Rolling release); as well as archlinux and
opensuse/tumbleweed (Rapid release) as of this writing.

This issue was reported upstream at [1].

Link: https://github.com/gpoore/fvextra/issues/32 [1]
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 utilities/runlatex.sh | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/utilities/runlatex.sh b/utilities/runlatex.sh
index 17d833ad..d5b1844d 100644
--- a/utilities/runlatex.sh
+++ b/utilities/runlatex.sh
@@ -169,6 +169,22 @@ then
 	echo "### Consider upgrading to Ubuntu 20.04 LTS or later.     ###"
 	echo "############################################################"
 fi
+# fvextra version check (Ubuntu 25.04 and 25.10 have buggy one
+FVEXTRA_VER=`grep -E -e 'fvextra .* v[0-9\.]+' $basename.log | \
+		sed -e 's/.* \(v.*\) fv.*/\1/'`
+#echo $FVEXTRA_VER
+FVEXTRA_BUGGY_SINCE=v1.11.0
+FVEXTRA_BUGGY_UNTIL=v1.13.2
+
+fvextra_since=`env printf "$FVEXTRA_BUGGY_SINCE\n$FVEXTRA_VER" | sort -V | head -n 1`
+fvextra_until=`env printf "$FVEXTRA_BUGGY_UNTIL\n$FVEXTRA_VER" | sort -V | tail -n 1`
+
+if [ $fvextra_since = $FVEXTRA_BUGGY_SINCE -a $fvextra_until = $FVEXTRA_BUGGY_UNTIL ] ; then
+	echo "Buggy fvextra $FVEXTRA_VER detected."
+	echo "It causes undesirable page/column breaks in short code snippets."
+	echo "Consider installing fvextra < $FVEXTRA_BUGGY_SINCE or > $FVEXTRA_BUGGY_UNTIL."
+fi
+
 # to avoid redundant run of bibtex and pdflatex
 touch $basename.bbl
 touch $basename.pdf

base-commit: f3d75a725a3efbb5ba4822d3f1b835c6ae08c464
-- 
2.43.0

