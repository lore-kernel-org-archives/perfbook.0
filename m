Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mail-vk0-f50.google.com ([209.85.213.50]:35170 "EHLO
 mail-vk0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org	with
 ESMTP id S1752211AbbLPNWG (ORCPT	<rfc822;perfbook@vger.kernel.org>); Wed, 16
 Dec 2015 08:22:06 -0500
Received: by mail-vk0-f50.google.com with SMTP id a189so25717115vkh.2 for
 <perfbook@vger.kernel.org>; Wed, 16 Dec 2015 05:22:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=mime-version:from:date:message-id:subject:to:content-type;
 bh=ndK221r1QoGiKf3W/M4lwBJ+MTX4m3s534vcAOSoKS4=;
 b=MKqkH3TV/OfW1XBMLnE8AsQMaCpoTnmuA25rnX/rWKB5FSDAVn93msdwrkdS/aJpE4
 Akg3BAVscYnY4bMVu/QkzpUZ4LOJ8j0bK6VpMTw2Kp9PiFBA7SurenEFtaXLGnOk4JpN
 OQ92ya175Z7nWrfjxUztMZxSddJIv5fe/icTyIk4EeDexk9wr8Rv03OPgSQPwJ9tt4OT
 9s4KfbqORQ2EgsS86aAD2WVJ1v5UWKSZZOopn2diNeM/Wt5/x5oApwKZBnXj7LpP6kha
 QDCDH1B+QZR90mObIhktamcbiFxM6Es4MjVK8K0H0VIjjJvmBqRBg88EtFCBw9xJkm/i
 nvDw==
MIME-Version: 1.0
From: Colin Pitrat <colin.pitrat@gmail.com>
Date: Wed, 16 Dec 2015 14:21:45 +0100
Message-ID: 
 <CABy3NjQQF+Kr+9MYmWVHY=b-d=NdOjTpiHMaKhuZzBECyDzOCA@mail.gmail.com>
Subject: Approximate structure-allocation limit problem improvement
Content-Type: text/plain; charset=UTF-8
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: perfbook@vger.kernel.org

Hello,

in chapter 5 (Counting), in the paragraph concerning "Approximate
structure-allocation limit problem", it is said:

"Similarly, sub_count() can fail even when the aggregate value of the
counter is nowhere near zero. In many cases, this is unacceptable."

In the case of the Quick Quiz 5.3 question, it's true that it's quite
a problem if it means freeing the structure fails because the counter
cannot be updated ! And freeing it without updating the counter means
the counter shifts from reality.

However, the very existence of the structure is a guarantee that the
real (total) counter value cannot be 0 or less than delta, so couldn't
we imagine to always succeed the sub_count operation by keeping a
global negative offset ? In the slow path, after globalize_count, if
the global count is lower than delta then we set it to 0 and we
increment the negative offset by what remains.

On the next slow path operation during a add_count, this negative
offset can be removed (or reduced) by reducing the local counter of
the thread by the same value.

This improvement over the proposed solution make it an acceptable
answer for the quick quiz 5.3 whereas it isn't without.

What do you think ?
Should I spend a bit of time writing a paragraph and a code sample about it ?

Regards,
Colin
