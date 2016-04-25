Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mail-pa0-f67.google.com ([209.85.220.67]:34930 "EHLO
 mail-pa0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org	with
 ESMTP id S932139AbcDYMeo (ORCPT	<rfc822;perfbook@vger.kernel.org>); Mon, 25
 Apr 2016 08:34:44 -0400
Received: by mail-pa0-f67.google.com with SMTP id zy2so18018509pac.2 for
 <perfbook@vger.kernel.org>; Mon, 25 Apr 2016 05:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=yxP7l9zwqU0rNIlzdOMOb5eQdmWIXcZ8rVg1ib85wWg=;
 b=WzdJ83B79eztSIbdbrwr715+7uWsUbNBqoLCT7+QYmZuRRLD9eQ9W2JDyins4sgrtz
 Mcdw5GxzcHfCsOC5dPDJD6dBt2htewhfWDdP0gHUI4r51EJ/6swnLTZ77o0BKfbWY7MF
 oBfcPwitpasWwvCXjxtW3XQoO6vY7aHI0Jy3dAARV/9IQsOefUUy3zR/FweSsfkAvBCI
 qxJTPT85JVprJfUggff6lGWS+cH8KP96mr2jE2DIoVqF1MwmoC/CEVP90CeRHrBJrZmE
 Tnro2QS2HmKFJZ+3xOagc4CZB3QaVXNFAJkNWJkdfC8mFKF/8BnYHus71vV4tYzr4arr
 Smow==
Subject: Re: [PATCH v3 1/3] qqz: Improve accuracy of cross-links
References: <571C1843.1060906@gmail.com> <571C1C8F.9000602@gmail.com>
 <571C42A1.8060201@gmail.com> <571C6CBB.4080101@gmail.com>
 <571CD6E7.4060301@gmail.com> <20160424175701.GU3756@linux.vnet.ibm.com>
 <571D4684.2030007@gmail.com> <20160424224808.GX3756@linux.vnet.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <571E0EDE.8030603@gmail.com>
Date: Mon, 25 Apr 2016 21:34:38 +0900
MIME-Version: 1.0
In-Reply-To: <20160424224808.GX3756@linux.vnet.ibm.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>

On 2016/04/24 15:48:08 -0700, Paul E. McKenney wrote:
> On Mon, Apr 25, 2016 at 07:19:48AM +0900, Akira Yokosawa wrote:
>> On 2016/04/24 10:57:01 -0700, Paul E. McKenney wrote:
>>> On Sun, Apr 24, 2016 at 11:23:35PM +0900, Akira Yokosawa wrote:
>>
>> [snip]
>>
>>>> There was no change in the behavior.
>>>
>>> Ah, that would explain the lack of complaints.  Most people reading
>>> the book on a mobile device use perfbook-1c.pdf, so the chapter
>>> links would work nicely for them.
>>
>> Then, wouldn't it be nicer if we change the default target in Makefile
>> to perfbook-1c.pdf ?
>>
>> Or how about just adding a shorter name target such as "1c" that would
>> build perfbook-1c.pdf ?
>>
>> Of course, we should be careful enough not to annoy people by a
>> sudden change of behavior.
> 
> I prefer the double-column layout because it takes less paper to print.

I see. You have the final say.

> But having "make 1c" create the single-column layout would be fine.

I'll see what I can do in this direction.

                                                     Thanks, Akira

> 
> 							Thanx, Paul
> 
>>>> I'm very glad I can contribute the perfbook project in this manner.
>>>>
>>>> So far, patches I submitted were mostly cosmetic changes.
>>>> I'm planning to submit something that touches the actual contents, too.
>>>> But don't expect too much.
>>>
>>> Cosmetic it might be, but I believe that readers will appreciate it
>>> very much!  Thank you again!
>>>
>>> 							Thanx, Paul
>>>
>>>
>>
> 
> 
