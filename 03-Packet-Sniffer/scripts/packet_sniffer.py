from scapy.all import sniff
import argparse
import sys

def process_packet(packet):
    print(f"[{packet.time}] {packet.summary()}")

def main():
    parser = argparse.ArgumentParser(description="Simple Packet Sniffer using Scapy")
    parser.add_argument('-i', '--interface', help="Network interface to sniff on (default: scapy's default)", default=None)
    parser.add_argument('-c', '--count', type=int, help="Number of packets to capture (0 for infinite)", default=10)
    args = parser.parse_args()

    try:
        print(f"[*] Starting packet capture on interface: {args.interface or 'default'} (count={args.count or 'infinite'})")
        sniff(prn=process_packet, iface=args.interface, count=args.count if args.count > 0 else 0)
    except PermissionError:
        print("[!] Permission denied: Try running as root/administrator.")
        sys.exit(1)
    except Exception as e:
        print(f"[!] Error: {e}")
        sys.exit(1)

if __name__ == "__main__":
    main()