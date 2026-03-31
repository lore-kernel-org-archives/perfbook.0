Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA4793D646E
	for <perfbook@vger.kernel.org>; Tue, 31 Mar 2026 07:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774943563; cv=none; b=jPmzNtrmQlSw2ps2dJem8IQM0NC9A2+OJvVvKEc9UBLyJW+SqbZn8gj7viF5E/iK5w9b/p7AoLiY9jb7DZS35eZhYTYuCSd8wTYU2EDhuumAucUcYS+gbSX+Fih4ZNODjNbL0R4CiDNl4tceXiNXvCpYZc4dB8z/mthBGWyERjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774943563; c=relaxed/simple;
	bh=br8NJelYnB2Wnu1TZx848RVpLr4KjCS15Ky5WSkFU3s=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=YwbF1lCHqEWc7PyHxxpG9819Wp0eP8kXQ2/T7P7Khsse2Yv1/tTqjsKKn/x9/km/76ETd2J8fnq4+7I5BUag4pdlucpyAAopJD7ZXLgVD5p1avdngAuG7H3fpFZ3bGRTPnrW3O0us/wzrOaPE1/YdqzwP4VCF/SHQaAYmXBmb0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EDLoPlu1; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EDLoPlu1"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-35d9f68d011so1572418a91.2
        for <perfbook@vger.kernel.org>; Tue, 31 Mar 2026 00:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774943561; x=1775548361; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nN4YK9ocFvSUMubbxgztZgvBv+a0WhJ5kGq982Jqf9M=;
        b=EDLoPlu1Ijje9Z5IT6WFhWXeb/AoDLo+ChGbPcMdlVSaPniUZah3wcJlSl2Uyod8kk
         fGN9g6u+wc8dhqWm+IYME7CsoWP7zykExMewe7VxRqFezA2Ezd92PmpfVuLeEfmYZrEI
         GKF0azbVg9PkEnHA3LhlK2Yq8Mfyjs8+PeX/ICyndq+lA1UC3H48O6VDF+XUQUwtXteT
         pzifoIX1WqpjwaCptHvzz4Ql6bupUSevBoDggQ6uUAiIgc8wK8zFl25ZgeJ1uLtNEM0S
         ai79n9gsdAo9u8IUvgIDxNSGI2+KtfpuFFFdqRkD/V7ItcslEMnYHb0xcUMAGLj75rio
         +YDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774943561; x=1775548361;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nN4YK9ocFvSUMubbxgztZgvBv+a0WhJ5kGq982Jqf9M=;
        b=Vma8x+E1CHwMC3KADUX4F0t5Ow3Ku+ZtUOvRAensuNaW2a391tYZNHl/BvYinWOeh+
         uWoY7OAaU2+Aw2n6QzwTqdH27u5zZHZ1nTecXtlgPmtXcM/sigZoZuru5a5GF5d35SqS
         PGjhySN68wLjCStW0EqoEdb/FxgTJr/F0rPxXgmDFZWKxGfb8b3n0GW4dM/v8oKaMcKK
         r3Mf1JhRr06U2AoQPXmSBzqJSt70szB8SYE8wPdCIgIa+cIr0NbnQYSM1l0DCNUiO8O3
         9nJVChv7NZFnLSfAyxrYLg8CIZYQfCRtvhTtCb2uJ+f/i8h+iMyWYA8dPR585/xfbsJ5
         GQuw==
X-Gm-Message-State: AOJu0YydZ8yK2fi3USsl7tPOjLgaV7Y0XCWBVj+Z97erOUsNmOky14nf
	aU8jPQcyF6rt5ZGTixKVhok/0PMfpt/6xRhDW+6KDZ+0QuQu+qUfwKhB
X-Gm-Gg: ATEYQzz1bUrNRvTSJp8eVrh6jpgD8f7eVuDiTyBekJLToQFXONRAoyOLY6KrI9usS0b
	7cI9JkfvtlLT1o0yhFwbmKwqsTaQ4vawhz0l2/m8DqorjJeqaojGT1DDdi2ODmyN7N/IqkbtHDO
	yO5ZEB8V6bEfikLNAvRzC7TIEYlD45S9O084xxb7XsJgt23ihT2cNHHBNVO2QnRvFmOxMKrUond
	NHVxjmcdls9ORafAeClinywlMgISE8WHP/3PnxGi8hgq1SbLF6DT7HCQZjqWHi2XMhdlcikPBoe
	BEQsrpGSzelJ4ao+DzXEF9Sn7iRamkv8hmnceLHjlFbBBVXjzZxLsY7GIfq0KTZrSd3P971XSCh
	0SOXIVpHKjI6ySYYv5u3NtiPdeKNSZDFdVDczTQuULPIunFjz+ODWYSwNjTmgEKiff214r+f3GP
	x/bnutCWsVRZuQVvwdBU8nQkqfTL6HQ3ylU1JZLp+YykWAPhmQuST/6QVor9hXi4X5i2+5
X-Received: by 2002:a17:902:da8b:b0:2b2:4df2:1e69 with SMTP id d9443c01a7336-2b24e0162f4mr90075605ad.4.1774943561051;
        Tue, 31 Mar 2026 00:52:41 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b242795195sm106402275ad.61.2026.03.31.00.52.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 00:52:40 -0700 (PDT)
Message-ID: <7304a7e5-2b6d-4109-9387-01fa4015cbf0@gmail.com>
Date: Tue, 31 Mar 2026 16:52:39 +0900
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
Subject: [PATCH -perfbook 1/3] adjustindexformat.pl: Cope with recent hyperref
 change
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

hyperref 7.01n (released in July 2025) made a change in the name of
its macro for formatting page counts in index [1].  It ended up in
a regression in our Index pages, namely, missing most page counts
with bold shape or underlined.
This issue is observed in recent CI-builds at
https://gitlab.com/linux-kernel/perfbook/.

Add regex'es to cover the patterns of "hyperxindexformat{...}".
   (in addition to those for existing "hyperindexformat{...}")

Link: https://ctan.org/ctan-ann/id/aFgfN-aRU1t7L2XT@prptp [1]
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 utilities/adjustindexformat.pl | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/utilities/adjustindexformat.pl b/utilities/adjustindexformat.pl
index 584b3232..52cfaae6 100755
--- a/utilities/adjustindexformat.pl
+++ b/utilities/adjustindexformat.pl
@@ -38,5 +38,11 @@ while($line = <$fh>) {
     $line =~ s/\{([^\|]+)(\|hyperindexformat)\{\\gl(@\\makefirstuc )\{.+\}\}\}/\{$1$3\{$1\}$2\{\\GL\}\}/ ;
     $line =~ s/\{([^\|]+)(\|hyperindexformat)\{\\gl(@\\makefirstuc )\{.+\}!([^\}]+)\}\}/\{$1$3\{$1}!$4$2\{\\GL\}\}/ ;
     $line =~ s/(\\makefirstuc )\{([^\)]+)\} \<([^\]]+)\>\|hyperpage\}/$1\{$2\} \($3\)|hyperindexformat\{\\GL\}\}/ ;
+    $line =~ s/\{([^\|]+)(\|hyperxindexformat)\{\\bf(@\\makefirstuc )\{.+\}\}\}/\{$1$3\{$1\}$2\{\\BF\}\}/ ;
+    $line =~ s/\{([^\|]+)(\|hyperxindexformat)\{\\bf(@\\makefirstuc )\{.+\}!([^\}]+)\}\}/\{$1$3\{$1}!$4$2\{\\BF\}\}/ ;
+    $line =~ s/(\\makefirstuc )\{([^\)]+)\} \[([^\]]+)\]\|hyperpage\}/$1\{$2\} \($3\)|hyperxindexformat\{\\BF\}\}/ ;
+    $line =~ s/\{([^\|]+)(\|hyperxindexformat)\{\\gl(@\\makefirstuc )\{.+\}\}\}/\{$1$3\{$1\}$2\{\\GL\}\}/ ;
+    $line =~ s/\{([^\|]+)(\|hyperxindexformat)\{\\gl(@\\makefirstuc )\{.+\}!([^\}]+)\}\}/\{$1$3\{$1}!$4$2\{\\GL\}\}/ ;
+    $line =~ s/(\\makefirstuc )\{([^\)]+)\} \<([^\]]+)\>\|hyperpage\}/$1\{$2\} \($3\)|hyperxindexformat\{\\GL\}\}/ ;
     print $line ;
 }

base-commit: bfce6d84f45d7aa5ffb4ea2202ca6a248adf5dff
-- 
2.43.0

