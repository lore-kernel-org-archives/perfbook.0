Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=jiEH4p/rHPasAf8FXyR1oChjijBCXucNG7EXXkgGZFw=;
 b=vN4ppHSrpPw0gWrmhvLkgxrLqtVlPTJnWSpp2BCebVy+P4mw37qd/4aMmgkDO7EvkW
 OQ1v5VO7CDAdd7EHgtijS8Zjmn5xuPkD/z7cBdSQiltYUe0UID3WBnYViFbVxQ00uFMQ
 qqvs7xpzsa4v1XHNpytl9ehKz1sZ8vXyXkMlyhJA/V4LGuCI4RaYxnEfN+klBJelAbDM
 kTymFjWqcpHGoZhLiMCtH16OkeDCNJFFMTXPhJsv2Dery+KcGR95eKQBRtaW50ybcJ0P
 f6tEj1RJGgDpVlhdzsyYwWmQZbTtZmBzLgK/YwGhOStAvoVZXsWKE3x9osEuX3Navo08
 wmPw==
Subject: Suggestion (was Re: [GIT PULL] Another round of qqz improvement)
References: <fd3e2eb5-8080-489a-60fa-72836512dd64@gmail.com>
 <20160707024557.GI4650@linux.vnet.ibm.com>
 <38f7bfb9-8532-02fc-524c-bfe0cd9115c6@gmail.com>
 <20160707185228.GL4650@linux.vnet.ibm.com>
 <6d120f0b-09f6-d90a-6969-e12f027b479f@gmail.com>
 <20160708221843.GP4650@linux.vnet.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <ac131a7f-76d7-39c0-8388-75db2a035a38@gmail.com>
Date: Sat, 9 Jul 2016 10:44:25 +0900
MIME-Version: 1.0
In-Reply-To: <20160708221843.GP4650@linux.vnet.ibm.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2016/07/08 15:18:43 -0700, Paul E. McKenney wrote:
[snip]
>> And how soon would the release be?
>
> With luck, in a few days.  More likely in a few weeks.
>
>> I'm preparing a (hopefully) final round of cosmetic fixes.
>> It's getting larger than I expected. I need to cleanup the commits to
>> distinguish actual fixes of something from just cosmetic ones so that you can
>> review them easily.  It may take another week or so.
>
> Well, unless the weekend's writing goes faster than normal (or, equivalently,
> as fast as hoped), you should make the current release.  Otherwise, there
> will be another release, hopefully much sooner than 18 months from now.

Before I forget it, I noticed a small issue I don't plan to fix in the cosmetic
fixes.

In Section 1.1, there is no mention of Chapter 16.  You might want to add
a sentence there.

                                                    Thanks, Akira

