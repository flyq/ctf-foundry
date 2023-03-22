use sha3::Digest;

fn main() {
    for i in 0..=255 {
        let mut hasher = sha3::Keccak256::default();
        hasher.update(&[i]);
        let bytes_i = hasher.finalize().to_vec();
        let hex_i = hex::encode(bytes_i);
        if hex_i.contains("db81b4d58595fbbbb592d3661a34cdca14d7ab379441400cbfa1b78bc447c365") {
            println!("hash({:?}): {:?}", i, hex_i);
        }
    }
}
