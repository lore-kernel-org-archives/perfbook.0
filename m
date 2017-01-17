Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=VIXx0z3/19zjqQumJ0JGWXecWIeQJOT/v0iI/E85klY=;
 b=Xxsl2Y1MKXl4Xl40NQ+lDOa1GO4rsz8gTe2OCOIMFCGAMJTW7h76qvb4LRXUNATct2
 rBhfgRCOu2KJsk0THc50W7syCGcu5uyD2aQitJ8GEpvH9ySoqRlQH2hs5Sd4QqFiCG7L
 pnCx14UgcAW7xAhY0pK76+Y9QM3z0dOs5RAUrJKbcEHR9qUWBSYLp6mEsEbAArnWmVnV
 PH8qs6Z8g5ONgULlXakieE3R7MchaA3mLa5aMUTI+BF+z2iS/0YEgG0E+gOWZXAOGeZY
 Mjl3W8qlFKL1cWUy9iqUDvbRLzUqQwVTNUYZlV1SL/zbuVk4JwbZv1cbfecz7V7n7YqW
 fEUQ==
Subject: Re: [PATCH] utilities/autodate.sh: too many \s
References: <20170116234125.28692-1-twoerner@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <d63ae83f-f918-73df-14f1-a7eb01f99e66@gmail.com>
Date: Tue, 17 Jan 2017 20:30:57 +0900
MIME-Version: 1.0
In-Reply-To: <20170116234125.28692-1-twoerner@gmail.com>
Content-Type: text/plain; charset=iso-2022-jp
Content-Transfer-Encoding: 7bit
To: Trevor Woerner <twoerner@gmail.com>
Cc: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, perfbook@vger.kernel.org, akiyks@gmail.com
List-ID: <perfbook.vger.kernel.org>

On 2017/01/16 18:41:25 -0500, Trevor Woerner wrote:
> Remove extraneous \ which causes build to fail:

Hi Trevor,

Apologies for submitting a non portable script.
I assumed that if a script works on "dash", it should work on other sh variants.
But it was a wrong assumption. I should have tested on "bash" at least.

I'm submitting a patch of the script with portability in mind.
Can you try it?

                                                   Thanks, Akira

