Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=MUkgtltTqcDqJbeQG8IMKXMqTBYWjFUXl7ZZ1phzHBU=;
 b=kieEra10btBBpu3VR9DdAgKFF63Nbi3caI7S6PsYYj7XN6hMmYJKsvKYDuuVthOttR
 0F664v2CqBtYlY2wH4wPT2K2/YAyIPWKmRTq5g8AKcszWeILIlNAUBm3fRzt79pgC+Rk
 9vC/ccqwfYCul0eaO9MvXy9lbWp5/HoviI+uKq6uEoymv82bcnSRKiO+RYfEu7As27FD
 rXKHjj2LxtHKK1lZVNGmQInWOke0z/6vpziZKrVlTWyY4+H5VZJZLivcf0YqAdNBdp2R
 VNClLotn7hEB/NvJnMQqYbfSm/r3eWDCx81EUhBbD40ld4lFYdd4BjbNcUpXlxKKkz9G
 rsaQ==
Subject: [PATCH v2 0/2] future: Update Locking and HTM comparison tables
References: <49209cfd-5494-fc54-ba4b-f8389ba4aed7@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <96abd2d1-8383-fef6-549b-3e156b9c571b@gmail.com>
Date: Thu, 7 Dec 2017 07:19:02 +0900
MIME-Version: 1.0
In-Reply-To: <49209cfd-5494-fc54-ba4b-f8389ba4aed7@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 0525a99211ea5bce67be8f5137c4abde142d8e8e Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Thu, 7 Dec 2017 07:05:32 +0900
Subject: [PATCH v2 0/2] future: Update Locking and HTM comparison tables

Hi Paul,

I found another typo in HTMtableRCU.tex.
This is a respin including the fix.
Please apply this set instead.

Change since v1:

    Fix typo (Privitization -> Privatization)

        Thanks, Akira
--
Akira Yokosawa (2):
  future: Update Locking and HTM comparison tables
  future: Add merged table of locking & HTM comparison

 appendix/styleguide/styleguide.tex |   6 -
 future/HTMtable.tex                | 201 ++++++++++++++---------------
 future/HTMtableColor.tex           |   9 ++
 future/HTMtableFull.tex            | 148 +++++++++++++++++++++
 future/HTMtableRCU.tex             | 254 +++++++++++++++++--------------------
 future/htm.tex                     |   6 +
 perfbook.tex                       |   1 +
 7 files changed, 370 insertions(+), 255 deletions(-)
 create mode 100644 future/HTMtableColor.tex
 create mode 100644 future/HTMtableFull.tex

-- 
2.7.4


