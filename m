Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C65018637
	for <perfbook@vger.kernel.org>; Thu, 29 Aug 2024 01:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724896465; cv=none; b=gTTLEcSKBuEjbyPKHtSU88EofPvf8ZQrBiDImd4NxGN1ho0jYaFEDARHGWBTzVdjfSTMggu5q5oCdGLpVwYxHqNp0OUFVi0pMbJIpaT0d4VvnjZH1mCjITjzbdIocFBsIRiOmFIPgy0auD/CdPlCdrEi+GWhmJXlW5GUt18VO2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724896465; c=relaxed/simple;
	bh=1aP01aFnQ6bUKDWvSiVeJD1BjaVESvoboSc7uoWaPtg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AgEsI0HdwJU/LwnIIXN4cJHKX/Fbd2yjWG75m0tqzhm6jfTQkBsxh6IRQFCheExj5EiXI4hwP9EhyGuzLa55HUz20MstAG6E7HAiixOHSrm277Ykj9LL5WviKZSQKmNuiXb0OqgrU1h1mLWPbqVOPYy6KZvc0a+FFiNCp50KkHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mf3vyjZf; arc=none smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mf3vyjZf"
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-3deedfa3a5aso80184b6e.0
        for <perfbook@vger.kernel.org>; Wed, 28 Aug 2024 18:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724896462; x=1725501262; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SAgWRIcEWnQNZ9HdTXaUyzWS/PySF3pI/1a/kyHOJbY=;
        b=Mf3vyjZfo9EOynO3kqigF8N80lDtJu333/OqKdwRSopHTvN+lPOdtL2hlYkCykkanU
         isn+OBQOfy9nnlzds1mQsMh5R7XTYnv+isdYXmEmH8T8RkMmkEX9QqVDM9YbErhH7ybn
         CM3FWQsKEODDJqb4sghATkKzgNiLBJAypGmMMVX2VeVOX5n7h3xEUkGP6txS+kMonisw
         zcBsnUd3mEQJL5zdRRVTCiUtCPUMuvcs18JTQgUJR8UBMmrccGtxH0RlyAxEzqfRa+9y
         VudMUiJWz69/Cxi+Cwk+9Z2d/OCcgFhtrCquXtaxxNXzpgfnC2Imw56nReNy5EJyABjB
         GLXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724896462; x=1725501262;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SAgWRIcEWnQNZ9HdTXaUyzWS/PySF3pI/1a/kyHOJbY=;
        b=HbSKL+SIOgxMixt84p9r1Be36rNaFPvr2u9xVxNMlr/zL7npHluE+Lh1ksj2W562o8
         gR9hZZ/ZzK3RgDt+GSylUN9I3cRyWcEuTczbbGgwmzFos8WNqFblIW11C8I7KOql9KZl
         xGFJm7O9UK87tzE0r/q4COTbYLenFmkZNaZo4OJrWzB6C/EBZCXfL/KfYiKmGYlB+hI/
         THi7sOcdvYkfBHWOOcbyVJgLoxuQ80amoY4vwtPZYjCa8hVDDldAZeM6AdxGjvaWfyae
         18jHdR2yPrj//yz2mISYJ5LL5CTbtZk6hfBa1fiv6MhypfdY8KWvH+g7y30lqBkWaz7Y
         U7eA==
X-Gm-Message-State: AOJu0YxFoP+1kqe7Bn29Z+WjNfp3VchR5YKo3jnnAg/HT0YTU5N3yjff
	eG+Rysh1RsZj1zhYdVtZI887rPG2IIkyDkqciA8+ZpBC6z70+sJS
X-Google-Smtp-Source: AGHT+IFwVXSkP9RSDskgg5KureZKKHXTejwaHyJ75glOuLoQnHcFUd0Y5+PPTmSezDZCOjq4GF0wEQ==
X-Received: by 2002:a05:6808:e8b:b0:3da:adc3:4a92 with SMTP id 5614622812f47-3df05c1f9cbmr1316258b6e.7.1724896462347;
        Wed, 28 Aug 2024 18:54:22 -0700 (PDT)
Received: from [10.0.2.15] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7d22e9be991sm153334a12.75.2024.08.28.18.54.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Aug 2024 18:54:22 -0700 (PDT)
Message-ID: <f6c03dc3-c190-437f-a3b4-8ded510511d7@gmail.com>
Date: Thu, 29 Aug 2024 10:54:20 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH -perfbook 1/5] bib: Replace citeseer{x} URLs
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <964bef9a-b1d4-4316-a846-b57e304ace50@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <964bef9a-b1d4-4316-a846-b57e304ace50@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Lots of URLs at citeseer and citeseerx.ist.psu.edu have stopped
working at least since December 2023.

There is an open issue titled "Error 502s using direct links or
the search form" at https://github.com/SeerLabs/CiteSeerX/issues/84,
which has got no response for more than 8 month.

As there is no sign of the issue resolved soon, replace those URLs
with direct links or DOIs.

For a USENIX paper who has a DOI, provide a URL under www.usenix.org
as a notes as well.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 bib/RCU.bib      |  2 +-
 bib/WFS.bib      |  4 +---
 bib/hw.bib       |  2 +-
 bib/os.bib       | 11 ++++++-----
 bib/syncrefs.bib |  2 +-
 5 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/bib/RCU.bib b/bib/RCU.bib
index 0d188b99..9ec242e6 100644
--- a/bib/RCU.bib
+++ b/bib/RCU.bib
@@ -1732,7 +1732,7 @@ lot of {Linux} into your technology!!!",
  title="Read-Copy-Update for OpenSolaris",
  school="Charles University in Prague",
  year="2010",
- url="https://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.185.1547&rep=rep1&type=pdf",
+ url="http://hdl.handle.net/20.500.11956/61313",
 }
 
 @unpublished{LinusTorvalds2011Linux2:6:38:rc1:NPigginVFS,
diff --git a/bib/WFS.bib b/bib/WFS.bib
index 1b153523..89227822 100644
--- a/bib/WFS.bib
+++ b/bib/WFS.bib
@@ -89,9 +89,7 @@ and Practice of Parallel Programming",
  booktitle = "International Conference on Distributed Computing Systems",
  pages = "264--273",
  year = "1993",
- url="Available:
-\url{http://citeseer.ist.psu.edu/cache/papers/cs/3947/ftp:zSzzSzftp.cs.cmu.eduzSzprojectzSzmachzSzdoczSzpublishedzSznon-blocking.pdf/bershad93practical.pdf}
-[Viewed March 1, 2005]",
+ doi = "10.1109/ICDCS.1993.287700",
 }
 
 @article{Kirousis94,
diff --git a/bib/hw.bib b/bib/hw.bib
index 5ddf0a39..63cc906e 100644
--- a/bib/hw.bib
+++ b/bib/hw.bib
@@ -106,7 +106,7 @@ and Zurek",
  number = "2/3",
  pages = "72-109",
  Year = "1994",
- url = "citeseer.ist.psu.edu/alpern92uniform.html",
+ doi = "10.1007/BF01185206",
 }
 
 @Book{IEEE1596SCI91,
diff --git a/bib/os.bib b/bib/os.bib
index a9666f94..75e5a9bb 100644
--- a/bib/os.bib
+++ b/bib/os.bib
@@ -266,7 +266,7 @@ Systems Principles ({SOSP})",
  number="5",
  pages="191--201",
  year="1989",
- url="citeseer.ist.psu.edu/massalin95threads.html",
+ doi="10.1145/74850.74869",
 }
 
 @Techreport{Massalin91,
@@ -562,7 +562,8 @@ Design and Implementation (OSDI)",
  Month="November",
  Year="1994",
  pages="179-193",
- url="citeseer.ist.psu.edu/cheriton94caching.html",
+ doi="10.1145/202453.202476",
+ note="Available: \url{https://www.usenix.org/conference/osdi-94/caching-model-operating-system-kernel-functionality}",
 }
 
 @Inproceedings{Cheriton96a,
@@ -687,8 +688,7 @@ Self-Healing Systems)",
 ({USENIX'01})",
  pages = "217-230",
  year = "2001",
- note="Available: \url{http://citeseer.ist.psu.edu/cache/papers/cs/21999/http:zSzzSzos.inf.tu-dresden.dezSzpapers_pszSzusenix2001.pdf/hohmuth01pragmatic.pdf}
-[Viewed January 30, 2005]",
+ url = "https://www.usenix.org/conference/2001-usenix-annual-technical-conference/pragmatic-nonblocking-synchronization-real-time",
 }
 
 
@@ -1240,7 +1240,8 @@ Placement",
  booktitle = "{USENIX} Summer Technical Conference",
  pages = "87-98",
  year = "1994",
- url = "citeseer.nj.nec.com/bonwick94slab.html",
+ url = "https://www.usenix.org/legacy/publications/library/proceedings/bos94/bonwick.html",
+ acmurl = "https://dl.acm.org/doi/10.5555/1267257.1267263",
 }
 
 @inproceedings{Bonwick01slab,
diff --git a/bib/syncrefs.bib b/bib/syncrefs.bib
index 92d9d1ff..2957ed64 100644
--- a/bib/syncrefs.bib
+++ b/bib/syncrefs.bib
@@ -364,7 +364,7 @@ Technology Symposium},
  pages={43--56},
  address={San Jose, CA},
  month="May~6-7",
- url={citeseer.ist.psu.edu/uhlig04towards.html},
+ url="https://www.usenix.org/legacy/events/vm04/tech/full_papers/uhlig/uhlig.pdf",
 }
 
 @phdthesis{BilgeEbruSaglamAkgul,
-- 
2.34.1


