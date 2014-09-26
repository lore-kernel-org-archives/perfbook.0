Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:53587 "EHLO
 out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)	by vger.kernel.org
 with ESMTP id S1753823AbaIZPY0 (ORCPT	<rfc822;perfbook@vger.kernel.org>);
 Fri, 26 Sep 2014 11:24:26 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])	by
 gateway2.nyi.internal (Postfix) with ESMTP id CB741205FE	for
 <perfbook@vger.kernel.org>; Fri, 26 Sep 2014 11:24:25 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=	messagingengine.com;
 h=message-id:x-sasl-enc:from:to
 :mime-version:content-transfer-encoding:content-type:subject	:date;
 s=smtpout; bh=Q1S7Mz0JofGjbE0LpMQfPI6py9A=; b=Q/rYDg0+oa0
 fO4279k7PuwOM3WWSr/GPx8Q2O2/OBQ4tr9bNLBMPZ586RhpAe3RpPzI+rUbaOmo
 mn2GPXIQhBI1qsDW5xHRed82zTC/OrZzP51PboPE+YIZWvqg3Dx/ZliPOg39NEe1
 MI6sDbenHGYyLH6Jpp6rL/VtlrKL2MQo=
Message-Id: 
 <1411745065.4175076.172118541.1DB2821F@webmail.messagingengine.com>
From: William Light <wrl@illest.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
Subject: Trouble building PDF on Arch
Date: Fri, 26 Sep 2014 17:24:25 +0200
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: perfbook@vger.kernel.org

Hey everyone,

I'm trying to build the perfbook PDF from a git clone, but latex keeps
exiting with a fatal error. I've installed just about everything
texlive-related (there's a catch-all package called texlive-most).

Here's the log:
http://illest.net/~will/perfbook.log.txt

Thanks,
-w
