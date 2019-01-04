Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=BcDfPPr5zKa6pwyTDqjW39XOd6j9gq7V33QT5eAYgu8=;
        b=Xt9e7afFxmG6MHeWShuUYuLoLYkve5rQKhCeIGRyIkLOyGj1wu5yr3QZ1x4zsrkOdD
         1DSpcSlI5LbQSbDzlxYlxk0J2ko66cOBgYnYsCiB4bRfavzG4mu9l+/vLBAT43ofOP9b
         fZCGXiqQ/hHlGDp3qn/ZbVOcoFPrB3bKsA+pvZeCDoxwevxKuAyih53J7ad4dK3D/89M
         cvk9Ppq+GrEa6fjOpc/5XkpLjMFTbAvlpavg/ewaJkYrmHafxzKfQzGeYyN5sNRHfGeh
         N5baFUh+ec1tRdjf9my5njg5G+3BhhtldQYyJ/WvUYrgexJQulhn1ik3lGgF8O/2QwlV
         zNEg==
Subject: Re: [PATCH] datastruct/hash: Tweak appearance of updated code in
 snippet
References: <20181226150018.GY4170@linux.ibm.com>
 <d7db020f-b296-97b6-3c2c-5ff31ca142ab@gmail.com>
 <c80b3564-ce7c-8ebe-23a4-6cf6d584dfa0@gmail.com>
 <20181231210307.GU4170@linux.ibm.com>
 <6ebd05a2-62be-478f-ab47-78862824072e@gmail.com>
 <20190101180025.GY4170@linux.ibm.com>
 <3fa9dcca-14d0-876d-fdcb-5db7eff3a97b@gmail.com>
 <20190102171848.GA4170@linux.ibm.com> <20190102191822.GA30360@linux.ibm.com>
 <a9847c9c-a7ca-5bf7-6936-7a68203c4fd2@gmail.com>
 <20190103172145.GG4170@linux.ibm.com>
 <69a2dffb-056c-29e3-fdfb-df61b705d416@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <faebf12a-02f1-df23-574c-8efe0385038c@gmail.com>
Date: Sat, 5 Jan 2019 00:38:53 +0900
MIME-Version: 1.0
In-Reply-To: <69a2dffb-056c-29e3-fdfb-df61b705d416@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

Now I know why you needed to hand-apply the patch.
My patch used white space characters in the indent of the folded line.
You used tab characters. Hence the conflict.

For the folded line to be properly aligned with the previous line
in the resulting Listing, it should have the same number of tabs
as the previous line.  Deeper indent should be represented by
space characters.

I'm submitting a patch to fix the indent of resize_lock_mod().

Also, there is some racy accesses in hash_resize.c.
2nd patch adds READ_ONCEs/WRITE_ONCEs where I think the accesses
are racy. Please have a look to see if they are really necessary.

This is not formatted as a cover letter. Sorry about that.

        Thanks, Akira 

